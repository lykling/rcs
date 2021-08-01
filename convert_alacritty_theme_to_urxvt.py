#!/usr/bin/env python
"""Convert alacritty theme to urxvt format
"""
import argparse
import os
import sys
import yaml


class Color():
    """Color
    """

    def __init__(self, colo_hex):
        """__init__
        """
        if isinstance(colo_hex, str):
            color = int(colo_hex, 16)
            self.color = color

    @property
    def red(self):
        """red
        """
        return (self.color >> 16) & 0xff

    @property
    def green(self):
        """green
        """
        return (self.color >> 8) & 0xff

    @property
    def blue(self):
        """blue
        """
        return self.color & 0xff

    @property
    def hex(self):
        """hex
        """
        return format(self.color, '06x')

    def __str__(self):
        """__str__
        """
        return f'0x{self.hex}'


class Theme():
    """Theme
    """

    COLOR_IDX_BLACK = 0
    COLOR_IDX_RED = 1
    COLOR_IDX_GREEN = 2
    COLOR_IDX_YELLOW = 3
    COLOR_IDX_BLUE = 4
    COLOR_IDX_MAGENTA = 5
    COLOR_IDX_CYAN = 6
    COLOR_IDX_WHITE = 7
    COLOR_IDX_BRIGHT_BLACK = 8
    COLOR_IDX_BRIGHT_RED = 9
    COLOR_IDX_BRIGHT_GREEN = 10
    COLOR_IDX_BRIGHT_YELLOW = 11
    COLOR_IDX_BRIGHT_BLUE = 12
    COLOR_IDX_BRIGHT_MAGENTA = 13
    COLOR_IDX_BRIGHT_CYAN = 14
    COLOR_IDX_BRIGHT_WHITE = 15

    COLOR_KEY_BLACK = 'black'
    COLOR_KEY_RED = 'red'
    COLOR_KEY_GREEN = 'green'
    COLOR_KEY_YELLOW = 'yellow'
    COLOR_KEY_BLUE = 'blue'
    COLOR_KEY_MAGENTA = 'magenta'
    COLOR_KEY_CYAN = 'cyan'
    COLOR_KEY_WHITE = 'white'
    COLOR_KEYS = [
        COLOR_KEY_BLACK,
        COLOR_KEY_RED,
        COLOR_KEY_GREEN,
        COLOR_KEY_YELLOW,
        COLOR_KEY_BLUE,
        COLOR_KEY_MAGENTA,
        COLOR_KEY_CYAN,
        COLOR_KEY_WHITE,
    ]

    def __init__(self, name, theme):
        """__init__
        """
        self.name = name
        colors = theme.get('colors')
        self.primary = argparse.Namespace(**{
            'background': Color(pathget(colors, 'primary.background')),
            'foreground': Color(pathget(colors, 'primary.foreground')),
        })
        self.normal = argparse.Namespace(**{
            x: Color(pathget(colors, f'normal.{x}')) for x in self.COLOR_KEYS
        })
        self.bright = argparse.Namespace(**{
            x: Color(pathget(colors, f'bright.{x}')) for x in self.COLOR_KEYS
        })

    def to_alacritty_str(self):
        """to_alacritty_str
        """
        out = {
            'colors': {
                'primary': {
                    'background': str(self.primary.background),
                    'foreground': str(self.primary.foreground),
                },
                'normarl': {
                    x: str(getattr(self.normal, x)) for x in self.COLOR_KEYS
                },
                'bright': {
                    x: str(getattr(self.bright, x)) for x in self.COLOR_KEYS
                },
            },
        }
        return '\n'.join([
            f'# {self.name}',
            yaml.safe_dump(out),
        ])

    def to_urxvt_str(self):
        """to_urxvt_str
        """
        prefix = 'URxvt'
        out_primary = [
            f'! Colors - {self.name}',
            f'{prefix}.background: #{self.primary.background.hex}',
            f'{prefix}.foreground: #{self.primary.foreground.hex}',
        ]

        def _normal_color(i, k):
            return f'{prefix}.color{i}: #{getattr(self.normal, k).hex}'

        def _bright_color(i, k):
            return f'{prefix}.color{i}: #{getattr(self.bright, k).hex}'

        out_normal_colors = list(
            _normal_color(i, k) for i, k in enumerate(self.COLOR_KEYS)
        )
        out_bright_colors = list(
            _bright_color(i + 8, k) for i, k in enumerate(self.COLOR_KEYS)
        )
        out = out_primary + out_normal_colors + out_bright_colors
        return '\n'.join(out)


def pathget(obj, path):
    """Get value from dict by path
    """
    if path == '':
        return obj
    path_parts = path.split('.', 1)
    if len(path_parts) < 2:
        return obj.get(path_parts[0])
    cur, nxt = path_parts
    return pathget(obj.get(cur), nxt)


def main():
    """Main entry
    """
    with open(sys.argv[1], 'r') as fin:
        name = os.path.basename(sys.argv[1]).rsplit('.', 1)[0]
        theme = Theme(name, yaml.safe_load(fin))
        print(theme.to_urxvt_str())
        print(theme.to_alacritty_str())


if __name__ == '__main__':
    main()

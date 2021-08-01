#!/usr/bin/env python
"""Generate color scheme
"""
import functools
import sys

COLOR_IDX_BLACK = 0
COLOR_IDX_RED = 1
COLOR_IDX_GREEN = 2
COLOR_IDX_YELLOW = 3
COLOR_IDX_BLUE = 4
COLOR_IDX_MAGENTA = 5
COLOR_IDX_CYAN = 6
COLOD_IDX_WHITE = 7

COLORS = {
    'TANGO': [
        (0x2e, 0x34, 0x36),
        (0xcc, 0x00, 0x00),
        (0x4e, 0x9a, 0x06),
        (0xc4, 0xa0, 0x00),
        (0x34, 0x65, 0xa4),
        (0x75, 0x50, 0x7b),
        (0x06, 0x98, 0x9a),
        (0xd3, 0xd7, 0xcf),
        (0x55, 0x57, 0x53),
        (0xef, 0x29, 0x29),
        (0x8a, 0xe2, 0x34),
        (0xfc, 0xe9, 0x4f),
        (0x72, 0x9f, 0xcf),
        (0xad, 0x7f, 0xa8),
        (0x34, 0xe2, 0xe2),
        (0xee, 0xee, 0xec),
    ],
    'MATERIAL': [
        (0x66, 0x66, 0x66),
        (0xeb, 0x60, 0x6b),
        (0xc3, 0xe8, 0x8d),
        (0xf7, 0xeb, 0x95),
        (0x80, 0xcb, 0xc4),
        (0xff, 0x2f, 0x90),
        (0xae, 0xdd, 0xff),
        (0xff, 0xff, 0xff),
        (0xff, 0x26, 0x2b),
        (0xeb, 0x60, 0x6b),
        (0xc3, 0xe8, 0x8d),
        (0xf7, 0xeb, 0x95),
        (0x7d, 0xc6, 0xbf),
        (0x6c, 0x71, 0xc4),
        (0x35, 0x43, 0x4d),
        (0xff, 0xff, 0xff),
    ],

}


def main():
    """Main entry
    """
    scheme = sys.argv[1].upper()
    color = COLORS.get(scheme)
    if color is not None:
        # for (i, fc, bc) in ([i] + color[i:i+2] for i in range(0, 16, 2)):
        #     to_hex = functools.partial(lambda x, y: format(y, x), '02x')
        #     fc_hex = ''.join(map(str, map(to_hex, fc)))
        #     bc_hex = ''.join(map(str, map(to_hex, bc)))
        #     print(f'URxvt.color{i//2}: #{fc_hex}')
        #     print(f'URxvt.color{i//2+8}: #{bc_hex}')

        for i, colo in enumerate(color):
            to_hex = functools.partial(lambda x, y: format(y, x), '02x')
            color_hex = ''.join(map(str, map(to_hex, colo)))
            print(f'URxvt.color{i}: #{color_hex}')


if __name__ == '__main__':
    main()

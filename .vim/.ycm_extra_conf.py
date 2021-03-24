import os

BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadi-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-I/usr/lib/',
    '-I/usr/include/',
    '-I/usr/local/fast-rtps/include/'
    '-I%s' % (os.path.abspath(os.path.curdir)),
]

SOURCE_EXTENSIONS = [
    '.cpp',
    '.cxx',
    '.cc',
    '.c',
    '.m',
    '.mm',
]

HEADER_EXTENSIONS = [
    '.h',
    '.hxx',
    '.hpp',
    '.hh',
]


def IsHeaderFile(filename):
    """IsHeaderFile
    """
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS

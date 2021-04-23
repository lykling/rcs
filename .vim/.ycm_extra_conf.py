import os

BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-x',
    'c++',
    '-DNDEBUG',
    '-std=c++11',
    '-I/usr/lib/',
    '-I/usr/include/',
    '-I/usr/include/eigen3/',
    '-I/usr/local/include',
    '-I/usr/local/fast-rtps/include/',
    '-I/home/foliage/.local/apollo-external/usr/local/libtorch_gpu/include',
    '-I/home/foliage/.local/apollo-external/usr/local/include',
    '-I/home/foliage/.local/apollo-external/usr/include',
    '-I./',
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


def Settings(**kwargs):
    """Settings
    """
    flags = BASE_FLAGS

    proj_root_name = os.path.basename(os.path.abspath(os.path.curdir))
    # find root in bazel cache directory for generated header files
    if os.path.exists('./.cache'):
        for root, subdirs, files in os.walk('./.cache', followlinks=True):
            if os.path.basename(root) == 'include':
                flags += [
                    '-I%s' % (root)
                ]
                subdirs[:] = []
                continue
            if os.path.basename(root) == 'external':
                flags += [
                    '-I%s' % (root)
                ]
                continue
            if os.path.basename(root) == 'execroot':
                hp = '/'.join([
                    root,
                    proj_root_name,
                    'bazel-out',
                    'k8-opt',
                    'bin',
                ])
                flags += ['-I%s' % (hp)]
                subdirs[:] = []
                continue
    return {
        'flags': flags
    }

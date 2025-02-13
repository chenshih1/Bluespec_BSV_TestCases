# -*- coding: utf-8 -*-
import siliconcompiler
from siliconcompiler.targets import freepdk45_demo

import os

if __name__ == '__main__':
    root = os.path.dirname(__file__)
    chip = siliconcompiler.Chip('mkDotProduct_nt_Int32')
    chip.input(os.path.join(root, 'DotProduct_nt_Int32.bsv'))
    chip.set('option', 'ydir', [r'.'])

    chip.set('option', 'nodisplay', True)
    chip.set('option', 'quiet', True)
    chip.set('option', 'remote', False)
    chip.clock(pin='CLK', period=1)
    chip.use(freepdk45_demo)
    chip.run()
    chip.summary()

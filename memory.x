MEMORY
{
  FLASH (rx) : ORIGIN = 0x10000, LENGTH = 0xf0000
  RAM_NVIC (rwx) : ORIGIN = 0x20000000, LENGTH = 0x100
  RAM_CRASH_DATA (rwx) : ORIGIN = (0x20000000 + 0x100), LENGTH = 0x100
  RAM (rwx) : ORIGIN = ((0x20000000 + 0x100) + 0x100), LENGTH = (0x40000 - (0x100 + 0x100))
}
OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")


library IEEE;
use IEEE.STD_LOGIC_1164.all;

package rom is

constant ROM_SIZE : integer := 56;
TYPE ROM is array(0 to ROM_SIZE - 1) of std_logic_vector(31 downto 0);

constant boot_rom : ROM := (
X"00000000",
X"10000001",
X"00000000",
X"3c088020",
X"3c108020",
X"240f0000",
X"020f7821",
X"8de90000",
X"3c08464c",
X"3508457f",
X"11090003",
X"00000000",
X"10000029",
X"00000000",
X"240f001c",
X"020f7821",
X"8df10000",
X"240f002c",
X"020f7821",
X"8df20000",
X"3252ffff",
X"240f0018",
X"020f7821",
X"8df30000",
X"262f0008",
X"020f7821",
X"8df40000",
X"262f0010",
X"020f7821",
X"8df50000",
X"262f0004",
X"020f7821",
X"8df60000",
X"1280000c",
X"00000000",
X"12a0000a",
X"00000000",
X"26cf0000",
X"020f7821",
X"8de80000",
X"ae880000",
X"26d60004",
X"26940004",
X"26b5fffc",
X"1ea0fff8",
X"00000000",
X"26310020",
X"2652ffff",
X"1e40ffe7",
X"00000000",
X"02600008",
X"00000000",
X"1000ffff",
X"00000000",
X"1000ffff",
X"00000000"
    ); 

 end rom;

--constant ROM_SIZE : integer := 53;
--TYPE ROM is array(0 to ROM_SIZE - 1) of std_logic_vector(31 downto 0);

--constant boot_rom : ROM := (
--"00000000000000000000000000000000",
--"00111100000100001011111000000000",
--"00100100000011110000000000000000",
--"00000010000011110111100000100001",
--"10001101111010010000000000000000",
--"00111100000010000100011001001100",
--"00110101000010000100010101111111",
--"00010001000010010000000000000011",
--"00000000000000000000000000000000",
--"00010000000000000000000000101001",
--"00000000000000000000000000000000",
--"00100100000011110000000000011100",
--"00000010000011110111100000100001",
--"10001101111100010000000000000000",
--"00100100000011110000000000101100",
--"00000010000011110111100000100001",
--"10001101111100100000000000000000",
--"00110010010100101111111111111111",
--"00100100000011110000000000011000",
--"00000010000011110111100000100001",
--"10001101111100110000000000000000",
--"00100110001011110000000000001000",
--"00000010000011110111100000100001",
--"10001101111101000000000000000000",
--"00100110001011110000000000010000",
--"00000010000011110111100000100001",
--"10001101111101010000000000000000",
--"00100110001011110000000000000100",
--"00000010000011110111100000100001",
--"10001101111101100000000000000000",
--"00010010100000000000000000001100",
--"00000000000000000000000000000000",
--"00010010101000000000000000001010",
--"00000000000000000000000000000000",
--"00100110110011110000000000000000",
--"00000010000011110111100000100001",
--"10001101111010000000000000000000",
--"10101110100010000000000000000000",
--"00100110110101100000000000000100",
--"00100110100101000000000000000100",
--"00100110101101011111111111111100",
--"00011110101000001111111111111000",
--"00000000000000000000000000000000",
--"00100110001100010000000000100000",
--"00100110010100101111111111111111",
--"00011110010000001111111111100111",
--"00000000000000000000000000000000",
--"00000010011000000000000000001000",
--"00000000000000000000000000000000",
--"00010000000000001111111111111111",
--"00000000000000000000000000000000",
--"00010000000000001111111111111111",
--"00000000000000000000000000000000"
--    ); 

-- end rom;
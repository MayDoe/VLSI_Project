LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY System IS
	PORT(
		clk : IN std_logic;
		Start,MoveDone,Rst  : IN std_logic;
		StartAddress : IN  std_logic_vector(11 DOWNTO 0);
		Mov,Dir,Done: out std_logic
		);
		
END ENTITY System;

ARCHITECTURE sys_a OF System IS
COMPONENT AF IS  
		PORT(
		  clk,Start,Ack,MoveDone,Rst: in std_logic;
		  StartAddress: in std_logic_vector(11 downto 0);
		  CacheData: in std_logic_vector(7 downto 0);
		  CacheAddress: out std_logic_vector(7 downto 0);
		  DMAAddress: out std_logic_vector(11 downto 0);
		  Mov,Dir,Done: out std_logic
		  );    
END COMPONENT;
COMPONENT Cache IS
	PORT(
		clk : IN std_logic;
		we  : IN std_logic;
		address : IN  std_logic_vector(7 DOWNTO 0);
		datain  : IN  std_logic_vector(7 DOWNTO 0);
		dataout : OUT std_logic_vector(7 DOWNTO 0));
END COMPONENT;
signal ack,we: std_logic;
signal cacheOut,cachein,cacheAdd: std_logic_vector(7 downto 0);
signal dmaadd: std_logic_vector(11 downto 0);
BEGIN

AF_Comp: Af port map (clk, start, ack, MoveDone,Rst, StartAddress, cacheOut,cacheAdd, dmaadd,Mov,Dir,Done);
Cache_comp: cache port map(clk,we,cacheAdd,cachein,cacheOut);  
  
END sys_a;






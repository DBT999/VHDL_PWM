library IEEE;  

use IEEE.std_logic_1164.all;  

  

package PulsePackage is  

  constant HIGH  : std_logic := '1';  

  constant LOW   : std_logic := '0';  

  constant ONE   : std_logic := '1';  

end package;  

  

library IEEE;  

use IEEE.MATH_REAL.all;  

use IEEE.std_logic_1164.all;  

use IEEE.numeric_std.all;  

use WORK.PulsePackage.all;  

  

entity PWM_Controller is  

  port (  

    clock    : in  std_logic;           -- Input clock.  

    duty     : in  std_logic_vector (7 downto 0);     

    bandwidth: in  std_logic_vector (3 downto 0);  

    pwm_out_A: out std_logic;            -- PWM output.  

    pwm_out_B: out std_logic             -- PWM output inverse.  

    );  

end entity;  

  

architecture Behavior of PWM_Controller is  

  signal timer_count: natural range 0 to 2**duty'length-1;  

begin  

  

  process(clock)  

  begin  

    if rising_edge(clock) then  

      pwm_out_A <= LOW;  

      timer_count <= timer_count + 1;  

  

      if timer_count >= to_integer(unsigned(bandwidth)) + to_integer(unsigned(duty)) then  

        pwm_out_B <= HIGH;  

      end if;  

  

      if timer_count < unsigned(duty) then  

        pwm_out_B <= LOW;  

        if timer_count >= unsigned 

 
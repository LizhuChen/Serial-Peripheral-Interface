# Serial-Peripheral-Interface
Verilog實現 Serial Peripheral Interface

SPI(Serial Peripheral Interface)，是一種同步的傳輸協定，主要應用於單晶片系統中，以Verilog code模擬實際運作情況

Waveform模擬:

![image](https://github.com/LizhuChen/Serial-Peripheral-Interface/blob/main/img/waveform.png)

MAC memory:

![image](https://github.com/LizhuChen/Serial-Peripheral-Interface/blob/main/img/MAC_memory.png)

輸入READ指令，並到MAC memory中的001取出16bit值，從MAC memory中可以看到001位置中儲存值為0000000011010010，和waveform圖模擬相同。

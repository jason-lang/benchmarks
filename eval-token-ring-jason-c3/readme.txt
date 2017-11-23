Similar to token-ring-c2, but

- two kinds of tokens: 1 and 2

- token type 2 works as before (it determines the end of the application)

- token type 1 demands a hard computation before being passed next

In this benchmark agents are always quite busy processing token1 while having to pass token1 forward.

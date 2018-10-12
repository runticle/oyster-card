### Oystercard ###

This is a simplified oystercard program. The user can create new cards and stations; can touch in and out at various stations and be charged accordingly. If the user forgets to tap in or out, they will be fined a penalty charge!

## How to use


Require oystercard.rb file in irb and create an Oystercard

```
require './lib/oystercard'
card = Oystercard.new
```

Create stations with a name and zone

```
richmond = Station.new("Richmond", 4)
```

Topup Oystercard £

```
card.topup(10)
```

touch_in and touch_out of various stations and have fun!

```
card.touch_in(richmond)
card.touch_out(aldgate)
```

Check balance
```
card.balance
```

A ticket inspector can check if you touched in with
```
card.in_journey?
```

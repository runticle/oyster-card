### Oystercard ###


## How to use


Require oystercard.rb file in irb
create an Oystercard

```
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

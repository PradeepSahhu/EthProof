# TokenCreation

## Explaination of TokenCreation Solidity Smart Contract.

There are three public state variables.

- tokenName (string) - tokenAbbrv (string)
- totalSupply (uint) [as totalSupply will always be 0 or more]

```Solidity

 mapping(address => uint) public balanceOfAddresses;

```

This is public mapping which maps the addresses to unsigned integers.

```Solidity

function mintToken(address _contributor, uint _amount) public {
        // checking if the address is already present or not.
        if(balanceOfAddresses[_contributor] == 0){ // doesn't already present and add it to the mapping.
            balanceOfAddresses[_contributor] = _amount;
        }else{
            balanceOfAddresses[_contributor]+=_amount;
        }
        totalSupply+=_amount;
    }

```

This is the mintToken public Function ( public so that anyone can call it)

```Solidity
if(balanceOfAddresses[_contributor] == 0){ // doesn't already present and add it to the mapping.
            balanceOfAddresses[_contributor] = _amount;
        }else{
            balanceOfAddresses[_contributor]+=_amount;
        }
```

This statement checks if the the given addresses is already present in the mapping or not.

if its present then it should be greater than 0 (not necessaryly).

- if not present then - It will initialize that address with the given value inside the mapping.
- if present then - it will just add that amount with the already present amount.

```Solidity

function burnToken(address _contributor, uint _amount) public {
        if(balanceOfAddresses[_contributor] >= _amount){
            balanceOfAddresses[_contributor] -= _amount;
            totalSupply-=_amount;
        }
    }

```

This burnToken public function checks if the given parameter amount is less than or equal to the amount present in the mapping.

- if yes then it will reduce itself from the amount present in mapping as well as from the totalSupply amount
- if not then no action will be done.

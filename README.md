# TokenCreation

## Explaination of TokenCreation Solidity Smart Contract.

There are three public state variables.

- tokenName (string)
- tokenAbbrv (string)
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

Some Screenshots from remix IDE
## STEP 1:

<img width="1469" alt="image" src="https://github.com/PradeepSahhu/EthProof/assets/94203408/f4d5efe0-e81b-4204-bc8a-66c1c2d7d834">


Initially totalSupply is 0 and as no mintToken is called so if we check any address's value inside mapping then it will show its default valut that is 0.

After calling the mintToken and passing the address and 5 token.

## STEP 2:

<img width="1470" alt="image" src="https://github.com/PradeepSahhu/EthProof/assets/94203408/4ddbe3f3-1773-4b24-9eac-3ab0ec30e7fe">

TotalSupply is now 5 and value associated with the address inside the mapping is 5.

Now if we try to remove more than 5 value from burnToken function (it will simply not work)

## STEP 3:
<img width="1470" alt="image" src="https://github.com/PradeepSahhu/EthProof/assets/94203408/4be54ead-9c72-4f34-8a16-11bd4d26010f">

Now adding another address with 3 as the amount. 

## STEP 4:

<img width="1469" alt="image" src="https://github.com/PradeepSahhu/EthProof/assets/94203408/2ca92d95-2c25-4cbb-b5cc-86ad3f69c16b">

So now, totalSupply is 8 ( prev 5 + now 3)

## STEP 5: 

<img width="1470" alt="image" src="https://github.com/PradeepSahhu/EthProof/assets/94203408/39676be1-df8e-43ed-97d7-26bc62b75de0">

Now removing 1 from the second address. therefore total now is 7 (prev 5 + now 2)


## SETTERS

```Solidity

 //setters for tokenName & tokenAbbrv

    function setTokenName(string memory _tokenName) public {
        tokenName = _tokenName;
    }

    function setTokenAbbrv(string memory _tokenAbbrv) public {
        tokenAbbrv = _tokenAbbrv;
    }
```



Through this function setting the vlaue of tokenName and tokenAbbrv. (if necessary)

******************* THE END *******************











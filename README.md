# Faucet and LiskToken Smart Contracts

## Overview

This repository contains two Solidity smart contracts deployed on the Sepolia network:

1. **Faucet**: A faucet contract that allows users to claim a small amount of tokens every 24 hours.
2. **LiskToken**: An ERC20 token contract for the "Lisk Token" (symbol: LSK).

## Faucet Contract

### Contract Address:
- **Sepolia Network**: [0x04A4f4D0ef5afF630816Fc6D5AdA65160bBF7023](https://sepolia-blockscout.lisk.com/address/0x04A4f4D0ef5afF630816Fc6D5AdA65160bBF7023#code)

### Features:
- **Daily Drip**: Users can claim 0.1 Lisk Token every 24 hours.
- **Ownership**: The contract owner can refill the faucet and transfer ownership to another address.
- **Donation**: Users can donate tokens back to the faucet.
- **Balance Check**: Users can check the faucet's balance at any time.

### Key Functions:
- `dripToken()`: Allows eligible users to claim 0.1 token every 24 hours.
- `receiveDonation(uint256 _amount)`: Enables users to donate tokens to the faucet.
- `refillFaucet(uint256 _amount)`: Allows the owner to add tokens to the faucet.
- `transferOwnership(address newOwner)`: Enables the owner to transfer ownership.
- `getFaucetBalance()`: Returns the current balance of the faucet.

## LiskToken Contract

### Contract Address:
- **Lisk-Sepolia Network**: [0x524bf1ef9fE1dd03096d3041Ad6C3e88f2d86830](https://sepolia-blockscout.lisk.com/address/0x524bf1ef9fE1dd03096d3041Ad6C3e88f2d86830#code)

### Features:
- **Mintable**: The contract owner can mint new Lisk Tokens.
- **Initial Supply**: 100,000 LSK tokens are minted to the contract owner's address at deployment.

### Key Functions:
- `mint(uint _amount)`: Allows the owner to mint new tokens.

## Deployment Links

- **Faucet Contract**: [Sepolia Blockscout](https://sepolia-blockscout.lisk.com/address/0x04A4f4D0ef5afF630816Fc6D5AdA65160bBF7023#code)
- **LiskToken Contract**: [Sepolia Blockscout](https://sepolia-blockscout.lisk.com/address/0x524bf1ef9fE1dd03096d3041Ad6C3e88f2d86830#code)

## License
This project is licensed under the MIT License.
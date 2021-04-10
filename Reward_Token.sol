pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/proxy/utils/Initializable.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";


contract RewardERC20 is Initializable, ERC20 {
    address private Contract_Mint;
    constructor() ERC20("Jupiter", "JPT") public {}
    function initialize(address _Contract_Mint) public virtual initializer {
        Contract_Mint = _Contract_Mint;
    }
    function mint_from_contract(address mint_to_address, uint256 mint_amount) public 
    {
        require(msg.sender == Contract_Mint);
        _mint(mint_to_address, mint_amount);
    }
}

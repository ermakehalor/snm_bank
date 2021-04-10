pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";

contract SNMT is ERC20 {
    constructor() ERC20("SNM Test", "SNMT") public {}
    function Mint(uint256 mint_amount) public
    {
        _mint(msg.sender, mint_amount);
    }
}

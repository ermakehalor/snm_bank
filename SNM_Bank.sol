pragma solidity ^0.8.0;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC1155/ERC1155.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/token/ERC20/ERC20.sol";
import "https://raw.githubusercontent.com/ermakehalor/snm_bank/main/Reward_Token.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/master/contracts/utils/math/SafeMath.sol";

contract SNM_Bank is ERC1155 {
    using SafeMath for uint256;
    ERC20 snm_token;
    RewardERC20 reward_token;
    uint256 public BigNumber;
    constructor(ERC20 _snm_token, RewardERC20 _reward_token, uint256 _BigNumber) public ERC1155("")
    {
        snm_token = _snm_token;
        reward_token = _reward_token;
        BigNumber = _BigNumber;
    }
    
    function DepositToken(uint256 _amount_snm1) public returns (uint256)
    {
        snm_token.transferFrom(msg.sender, address(this), _amount_snm1);
        uint256 newItemId = block.timestamp;
        _mint(msg.sender, newItemId, _amount_snm1, "");
        return newItemId;
    }
    function WithdrawToken(uint256 DepositID, uint256 _amount_snm2) public
    {
        _burn(msg.sender, DepositID, _amount_snm2);
        snm_token.transfer(msg.sender, _amount_snm2);
        uint256 currentTimeStamp = block.timestamp;
        uint256 reward_amount = _amount_snm2.mul(BigNumber).div(DepositID).sub(_amount_snm2.mul(BigNumber).div(currentTimeStamp));
        if (reward_amount >= 0)
        {reward_token.mint_from_contract(msg.sender, reward_amount);}
    }
}

pragma solidity ^0.4.17;


/*
 * @title Interface for BondingManager
 * TODO: switch to interface type
 */
contract IBondingManager {
    event TranscoderUpdate(address indexed transcoder, uint256 pendingBlockRewardCut, uint256 pendingFeeShare, uint256 pendingPricePerSegment);
    event TranscoderEvicted(address indexed transcoder);
    event TranscoderResigned(address indexed transcoder);
    event TranscoderSlashed(address indexed transcoder, uint256 penalty);
    event Reward(address indexed transcoder, uint256 amount);
    event Bond(address indexed delegate, address indexed delegator);
    event Unbond(address indexed delegate, address indexed delegator);
    event WithdrawStake(address indexed delegator);
    event WithdrawFees(address indexed delegator);

    // External functions
    function setActiveTranscoders() external;
    function updateTranscoderWithFees(address _transcoder, uint256 _fees, uint256 _round) external;
    function slashTranscoder(address _transcoder, address _finder, uint256 _slashAmount, uint256 _finderFee) external;
    function electActiveTranscoder(uint256 _maxPricePerSegment, uint256 _block, uint256 _round) external view returns (address);

    // Public functions
    function transcoderTotalStake(address _transcoder) public view returns (uint256);
    function activeTranscoderTotalStake(address _transcoder, uint256 _round) public view returns (uint256);
    function getTotalBonded() public view returns (uint256);
}

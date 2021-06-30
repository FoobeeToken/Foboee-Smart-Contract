pragma solidity >0.5.99 <0.8.0;

    contract Owner
    {
        address private _owner;
        mapping(address=> bool) Freezelist;
        event AddToFreezelist(address _Freezelisted);
        event RemoveFromFreezelist(address _whitelisted);
        constructor() public
        {
            _owner = msg.sender;
        }

        function getOwner() public view returns(address) { return _owner; }

        modifier isOwner()
        {
            require(msg.sender == _owner,'Your are not Authorized user');
            _;

        }

        modifier isFreezelisted(address holder)
        {
            require(Freezelist[holder] == false,"You are Freezelisted");
            _;
        }

        function chnageOwner(address newOwner) isOwner() external
        {
            _owner = newOwner;
        }

        function addtoFreezelist (address Freezelistaddress) isOwner()  public
        {
            Freezelist[Freezelistaddress] = true;
            emit AddToFreezelist(Freezelistaddress);
        }

        function removefromFreezelist (address whitelistaddress) isOwner()  public
        {
            Freezelist[whitelistaddress]=false;
            emit RemoveFromFreezelist(whitelistaddress);
        }

        function showstateofuser(address _address) public view returns (bool)
        {
            return Freezelist[_address];
        }
    }

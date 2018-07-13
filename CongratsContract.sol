pragma solidity ^0.4.24;

// Roma, s Dnem Rozhdenia!
contract RomasCongrats {
    address owner;
    string congrats;
    string picture;
    bool isLocked = false;

    constructor() public {
        owner = msg.sender;
        congrats="";
        picture="";
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    modifier isNotLocked() {
        require(isLocked == false);
        _;
    }

    function lock() public onlyOwner {
        isLocked = true;
    }

    function checkIsLocked() public constant returns(bool) {
        return isLocked;
    }

    function transferOwnership(address newOwner) public onlyOwner {
	    owner = newOwner;
    }

    function setASCIIPicture(string newPic) public onlyOwner isNotLocked {
        picture = newPic;
    }

    function setCongrats(string newCongrats) public onlyOwner isNotLocked {
        congrats = newCongrats;
    }

    function getCongrats() public constant returns(string) {
        return congrats;
    }

    function getASCIIPic() public constant returns(string) {
        return picture;
    }
}

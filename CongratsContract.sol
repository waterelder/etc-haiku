pragma solidity ^0.4.24;
import "github.com/Arachnid/solidity-stringutils/strings.sol";


// Roma, s Dnem Rozhdenia!
contract RomasCongrats {
    using strings for *;
    address owner;
    string congrats;
    string picture;

    constructor() public {
        owner = msg.sender;
        congrats="";
        picture="";
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
	    owner = newOwner;
    }

    function setASCIIPicture(string newPic) public onlyOwner {
        picture = newPic;
    }

    function setCongrats(string newCongrats) public onlyOwner {
        congrats = newCongrats;
    }

    function getCongrats() public constant returns(string) {
        return congrats;
    }

    function getASCIIPic() public constant returns(string) {
        return picture;
    }
}

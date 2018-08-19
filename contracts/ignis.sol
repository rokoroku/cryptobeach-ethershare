pragma solidity ^0.4.24;


/**
* @title SafeMath
* @dev Math operations with safety checks that throw on error
*/
library SafeMath {

    /**
    * @dev Multiplies two numbers, throws on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        if (a == 0) {
            return 0;
        }
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    /**
    * @dev Integer division of two numbers, truncating the quotient.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    /**
    * @dev Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        assert(b <= a);
        return a - b;
    }

    /**
    * @dev Adds two numbers, throws on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }
}


contract Igins {
    using SafeMath for uint256;
    address donater;
    address donatee;
    uint256 balance;

    event DonationMsg (bytes _data, address _sender, uint256 _value);
    event DonationTo (uint256 _value, uint256 _balance);
    event funding (uint256 _value, uint256 _balance);

    function Funding() payable public {
        balance = msg.value;
        emit funding(msg.value, balance);
    }

    function Donating() payable public {
        donatee.transfer(msg.value);
        balance = msg.value;
        emit DonationTo(msg.value, balance); 
    }

    function CheckMsg() payable public {
        emit DonationMsg(msg.data, msg.sender, msg.value);
    }



}
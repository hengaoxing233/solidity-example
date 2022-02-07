// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//打印log日志
contract ExampleEvent{

    event Deposit(address _from, string _name, uint256 _value);

    function deposit(string memory _name) public payable{
        emit Deposit(msg.sender, _name, msg.value);
    }
}

/**
topic = Keccak-256(Deposit(address,string,uint256))
[
	{
		"from": "0xfC313a43C1e29Cbf9B78BD91BD7d0196dB69a93b",
		"topic": "0x2d4b597935f3cd67fb2eebf1db4debc934cee5c7baa7153f980fdbeb2e74084e",
		"event": "Deposit",
		"args": {
			"0": "0xca49E1c60179442AED89c8e0779814529eE58769",
			"1": "hhh",
			"2": "200",
			"_from": "0xca49E1c60179442AED89c8e0779814529eE58769",
			"_name": "hhh",
			"_value": "200"
		}
	}
]
*/

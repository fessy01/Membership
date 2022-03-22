
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Membership {
  struct Member{
    uint id;
    string name;
    uint age;
    string dateOfRegistration;
  }
  mapping (uint => Member) public members;
  event SavingsEvent(uint indexed _memberId);
  uint public memberCount;

  constructor(){
    memberCount = 0;
   
  }
  function addMember(string memory _name, uint _age, string memory _DateOfRegistration) public {
    members[memberCount] = Member(memberCount,_name,_age, _DateOfRegistration);
    memberCount++;
  }

  function get(uint _memberId) public view returns(Member memory) {
    return members[_memberId];
  }

  function getMember() public view returns (uint[] memory, string[] memory,uint[]
  memory){
      uint[]    memory id = new uint[](memberCount);
      string[]  memory name = new string[](memberCount);
      uint[]    memory age = new uint[](memberCount);
      string[]  memory dateOfRegistration = new string[](memberCount);
      for (uint i = 0; i < memberCount; i++) {
          Member storage member = members[i];
          id[i] = member.id;
          name[i] = member.name;
          age[i] = member.age;
          dateOfRegistration[i] = member.dateOfRegistration;
      }
      return (id, name,age);
  }

    

  
}
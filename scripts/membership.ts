import { ethers } from "hardhat";
import { Membership } from "../typechain";

async function deployMembership() {

  const Membership = await ethers.getContractFactory("Membership");
  const membership = await Membership.deploy();

  await membership.deployed();

  const add = await membership.addMember("tota", 12, "12/02/2022");
  const get = await membership.getMember()
  console.log(get);

  console.log("Membership deployed to:", membership.address);
}

deployMembership().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
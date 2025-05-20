const hre = require("hardhat");

async function main() {
  const TipJar = await hre.ethers.getContractFactory("TipJar");
  const tipJar = await TipJar.deploy();

  await tipJar.waitForDeployment();
  console.log("✅ Contract deployed to:", tipJar.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

const connectBtn =
document.getElementById("connectBtn");

const walletAddress =
document.getElementById("walletAddress");

async function connectWallet(){

  if(!window.ethereum){

    alert("Please install MetaMask");

    return;
  }

  try{

    const accounts =
    await ethereum.request({
      method:"eth_requestAccounts"
    });

    const userAddress =
    accounts[0];

    walletAddress.innerText =
      userAddress.substring(0,6)
      + "..."
      + userAddress.substring(userAddress.length - 4);

    connectBtn.innerText =
      "Wallet Connected";

  }catch(error){

    console.log(error);

    walletAddress.innerText =
      "Connection Failed";

  }

}

connectBtn.addEventListener(
  "click",
  connectWallet
);

const navLinks =
document.querySelectorAll(".nav-links a");

navLinks.forEach(link => {

  link.addEventListener("click", function(e){

    e.preventDefault();

    const targetId =
    this.getAttribute("href");

    const targetSection =
    document.querySelector(targetId);

    targetSection.scrollIntoView({
      behavior:"smooth"
    });

  });

});

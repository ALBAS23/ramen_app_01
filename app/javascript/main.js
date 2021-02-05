const charCounter = () => {
  const input = document.getElementById("person_self_introduction");
  const count = document.getElementById("introduction-counter");
  const alert = document.getElementById("introduction-counter-alert")
  const erStyleIn = {
    color: 'red',
    fontWeight: 'bold'
  };
  const erStyleOut = {
    color: 'black',
    fontWeight: 'normal'
  }
  const strJudge = (num) => {
    if (num > 400) {
      for(let prop in erStyleIn) {
        count.style[prop] = erStyleIn[prop];
      }
      count.innerHTML = num;
      alert.style.display = 'block';
    } else {
      for(let prop in erStyleOut) {
        count.style[prop] = erStyleOut[prop];
      }
      count.innerHTML = num;
      alert.style.display = 'none';
    }
  };
  const firstCount = input.value.length
  strJudge(firstCount);
  
  input.addEventListener("input", () => {
    let strCount = input.value.length;
    strJudge(strCount);
  });
};

window.addEventListener('load', charCounter);


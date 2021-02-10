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

const favorite = () => {
  const favoriteBtnBefore = document.getElementById("favorite-btn-register");
  const favoriteBtnAfter = document.getElementById("favorite-btn-release");
  if (favoriteBtnAfter.classList.contains("favorite-judge")) {

  } else {
    favoriteBtnAfter.classList.remove("favorite-judge");
    favoriteBtnBefore.classList.add("favorite-judge");
  }
  favoriteBtnBefore.addEventListener("click", ()=> {
    const formData = new FormData();
    const userId = favoriteBtnBefore.getAttribute("data-user-id");
    const postId = favoriteBtnBefore.getAttribute("data-post-id");
    const XHR = new XMLHttpRequest();
    formData.append("post_id", postId);
    formData.append("user_id", userId);
    formData.append("authenticity_token", document.getElementsByName('csrf-token')[0].content)
    XHR.open("POST", `/posts/${postId}/users/${userId}/favorites`, true);
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      const judge = XHR.response.favorite;
      const count = XHR.response.favorite_count.length;
      if (Object.keys(judge).length !== 0) {
        favoriteBtnBefore.classList.add("favorite-judge");
        favoriteBtnAfter.classList.remove("favorite-judge");
        favoriteBtnAfter.setAttribute("data-id", judge[0].id);
        document.getElementById("favorite-count").innerText = count;
      }
    }
  })

  favoriteBtnAfter.addEventListener("click", () => {
    const formData = new FormData();
    const userId = favoriteBtnAfter.getAttribute("data-user-id");
    const postId = favoriteBtnAfter.getAttribute("data-post-id");
    const id = favoriteBtnAfter.getAttribute("data-id");
    const XHR = new XMLHttpRequest();
    formData.append("post_id", postId);
    formData.append("user_id", userId);
    formData.append("id", id);
    formData.append("authenticity_token", document.getElementsByName('csrf-token')[0].content)
    XHR.open("DELETE", `/posts/${postId}/users/${userId}/favorites/${id}`, true);
    XHR.responseType = "json";
    XHR.send(formData);

    XHR.onload = () => {
      const count = XHR.response.favorite_count.length;
      favoriteBtnBefore.classList.remove("favorite-judge");
      favoriteBtnAfter.classList.add("favorite-judge");
      favoriteBtnAfter.removeAttribute("data-id");
      document.getElementById("favorite-count").innerText = count;
    }
  })
};

window.addEventListener('load', favorite);
window.addEventListener('load', charCounter);


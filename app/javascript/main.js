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
        document.getElementById("fa-heart-before").setAttribute("style", "display: none");
        document.getElementById("fa-heart-after").removeAttribute("style");
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
      document.getElementById("fa-heart-after").setAttribute("style", "display: none");
      document.getElementById("fa-heart-before").removeAttribute("style");
    }
  })
};

const search = () => {
  const searchCategory = document.getElementById("search-category-form");
  searchCategory.addEventListener('change', () => {
    const text = searchCategory.selectedOptions[0].innerText;
    const keywordFree = document.getElementById("keyword_free");
    const keywordPrice = document.getElementById("keyword_price");
    const keywordGenre = document.getElementById("keyword_genre");
    const keywordPrefecture = document.getElementById("keyword_prefecture");
    if (text == "キーワード検索") {
      keywordFree.classList.remove("search-status-none");
      keywordPrice.classList.add("search-status-none");
      keywordGenre.classList.add("search-status-none");
      keywordPrefecture.classList.add("search-status-none");
      keywordPrice.value = "";
      keywordGenre.value = "";
      keywordPrefecture.value = "";
    } else if (text == "値段") {
      keywordFree.classList.add("search-status-none");
      keywordPrice.classList.remove("search-status-none");
      keywordGenre.classList.add("search-status-none");
      keywordPrefecture.classList.add("search-status-none");
      keywordFree.value = "";
      keywordGenre.value = "";
      keywordPrefecture.value = "";
    } else if (text == "ジャンル") {
      keywordFree.classList.add("search-status-none");
      keywordPrice.classList.add("search-status-none");
      keywordGenre.classList.remove("search-status-none");
      keywordPrefecture.classList.add("search-status-none");
      keywordFree.value = "";
      keywordPrice.value = "";
      keywordPrefecture.value = "";
    } else if (text == "都道府県") {
      keywordFree.classList.add("search-status-none");
      keywordPrice.classList.add("search-status-none");
      keywordGenre.classList.add("search-status-none");
      keywordPrefecture.classList.remove("search-status-none");
      keywordFree.value = "";
      keywordPrice.value = "";
      keywordGenre.value = "";
    }
  });
};

window.addEventListener('load', favorite);
window.addEventListener('load', charCounter);
window.addEventListener('load', search);


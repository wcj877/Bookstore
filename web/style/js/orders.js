lis = document.querySelectorAll(".titleb");
console.log(lis)
for (let i = 0; i < lis.length; i++) {
    lis[i].onclick = function () {
        for (let j = 0; j < lis.length; j++) {
            lis[j].style.backgroundColor="#ffffff";
            lis[j].style.color="#22B14C"
        }

        lis[i].style.backgroundColor = "#22B14C";
        lis[i].style.color="#fff"
    }
}
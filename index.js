document.querySelector(".btn_cv_download").addEventListener("click", () => {
    const link = document.createElement("a");
    link.href = "./PetrChalupa_CV.pdf";
    link.download = "PetrChalupa_CV.pdf";
    link.click();
});

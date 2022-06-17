<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal{
		position: absolute;
		top : 0;
		left : 0;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.4);
	}
	.modal-dialog{
		position: absolute;
		width: 40%;
		height: 700px;
		margin-top:5%;
		margin-left: 30%;
	}
	
	.modal-content{
		position: absolute;
		width:100%;
		height:100%
		padding: 40px;
		text-align: center;
		background-color:white;
		border-radius: 10px;
		box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
	}
	.file-label {
  margin-top: 10%;
  background-color: #ff9999;
  color: #fff;
  text-align: center;
  padding: 10px 0;
  width: 65%;
  border-radius: 6px;
  cursor: pointer;
}
.file {
  display: none;
}
.upload-box {
  width: 44%;
  box-sizing: border-box;
  display: inline-block;
  vertical-align:top;
  align-items: center;
}
.upload-box .drag-file {
  width: 100%;
  height: 360px;
  margin-top:0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  border: 3px dashed gray;
}
.upload-box .drag-file.highlight {
  border: 3px dashed #ff9999;
}
.upload-box .drag-file .image {
  width: 40px;
}
.upload-box .drag-file .message {
  margin-bottom: 0;
}
.files {
  width: 44%;
  box-sizing: border-box;
  overflow: auto;
  height: 360px;
  display: inline-block;
}
.files .file {
  display: flex;
  padding: 20px 20px;
  border-bottom: 1px solid #dbdbdb;
}
.files .file:last-child {
  margin-bottom: 0px;
  border-bottom: none;
}

.files .file .details {
  flex: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.files .file .details .header {
  display: flex;
}
.files .file .details .header .name {
  width: 100px;
  white-space: nowrap;
  text-overflow: ellipsis;
  overflow: hidden;
}
.files .file .details .header .size {
  margin-left: auto;
}
.files .file .progress {
  position: relative;
  height: 6px;
  background-color: #ff9999;
  overflow: hidden;
  margin-top: 4px;
  border-radius: 10px;
}
.files .file .progress .bar {
  position: absolute;
  left: 0;
  top: 0;
  height: 100%;
  width: 100%;
  background-color: #ff9999;
}
.files .file .status {
  display: flex;
  width: 100%;
}
.files .file .status .speed {
  margin-left: auto;
}
</style>
</head>
<body>
	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">사진 추가</h4>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="upload-box">
  					<div id="drop-file" class="drag-file">
    					<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image">
    					<p class="message">Drag files to upload</p>
 					</div>
					</div>
					<div id="files" class="files">
  					<div class="file">
    					
    					<div class="details">
      						<header class="header">
        						<span class="name">Photo.png</span>
        						<span class="size">7.5 mb</span>
      						</header>
      					<div class="progress">
        					<div class="bar"></div>
      					</div>
      					<div class="status">
        					<span class="percent">37% done</span>
        					<span class="speed">90KB/sec</span>
      					</div>
    				</div>
  					</div>
					</div>
					<label class="file-label" for="chooseFile">Choose File</label>
					<input class="file" id="chooseFile" type="file" multiple>
					
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" id = "modalClose">확인</button>
				</div>

			</div>
		</div>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		var modal = document.querySelector(".modal");
		document.querySelector("#modalClose").onclick = function(){
			modal.style.display = 'none';
		};
		const dropArea = document.getElementById("drop-file");
		const fileList = document.getElementById("files");
		function highlight(e) {
				e.preventDefault();
			  dropArea.classList.add("highlight");
			}

			function unhighlight(e) {
				e.preventDefault();
				dropArea.classList.remove("highlight");
			}

			dropArea.addEventListener("dragenter", highlight);
			dropArea.addEventListener("dragover", highlight);
			dropArea.addEventListener("dragleave", unhighlight);
		
		function renderFile(file) {
			  let fileDOM = document.createElement("div");
			  fileDOM.className = "file";
			console.log(file.name);
			  fileDOM.innerHTML = "<div class='details'><header class='header'><span class='name'>"
			        +file.name+
			        "</span><span class='size'>"
			        +file.size+
			        "</span></header><div class='progress'><div class='bar'></div></div><div class='status'><span class='percent'>100% done</span><span class='speed'>90KB/sec</span></div></div>";
			  return fileDOM;
			}

		
		
		function handleDrop(e) {
			  unhighlight(e);
			  let dt = e.dataTransfer;
			  let files = dt.files;

			  console.log(files);
			  
			  // addToFileList
			  // ...
			  files = [...files];
			  files.forEach(file => fileList.appendChild(renderFile(file)));
			}
		 dropArea.addEventListener("drop", handleDrop, false);
	</script>
</body>
</html>
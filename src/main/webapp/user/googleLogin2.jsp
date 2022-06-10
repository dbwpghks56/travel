<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="google-signin-scope" content="profile email">
  	<meta name="google-signin-client_id" content="572568991072-5fvodmqdgno1dh4mj6ebh2cuf6nqii94.apps.googleusercontent.com">
	<script src = "http://apis.google.com/js/platform.js" async defer></script>
</head>
<body>
	<div>
    <button class="lin-google" onClick={googleLoginHandler}>
    <div class="lin-google-logo"></div>
    <div class="lin-google-text">구글 로그인</div>
    </button>
   </div>
<script>
const authorizationCode = url.searchParams.get("code");

const handleGetAccessToken = async (authorizationCode) => {
   await axios.post(
      "http://localhost:9090/sign/google", // 구글 소셜 로그인 엔드포인트
      {
        authorizationCode: authorizationCode,
      },
      {
        headers: { accept: `application/json` },
      },
    );
   const code = req.body.authorizationCode // 인증 코드 받기
   const url = `https://oauth2.googleapis.com/token?code=${code}&client_id=${process.env.GOOGLE_CLIENT_ID}&client_secret=${process.env.GOOGLE_CLIENT_SECRET}&redirect_uri=${process.env.GOOGLE_REDIRECT_URI}&grant_type=${process.env.GOOGLE_GRANT_TYPE}`

   const access_token = await axios
   	.post(url, {
   		headers: { "content-type": "application/x-www-form-urlencoded" },
   	})
   	.then((el) => { 
   		return el.data.access_token
   	})
   	.catch((err) => {
   		console.log("err=", err)
   	})
   
   onst googleAPI = `https://www.googleapis.com/oauth2/v2/userinfo?access_token=${access_token}`
	   const userInfo = await axios
	   	.get(googleAPI, {
	   		headers: {
	   			authorization: `Bearer ${access_token}`,
	   		},		
	       	})
	   	.then((el) => {
	   		return el.data
	   	})
	   	.catch((err) => {
	   		console.log("err=", err)
	   	})

	   	const email = userInfo.email
	   	const [result, created] = await db.addGoogleUser(email) 
	   	if (!created) {
	   		return res.status(400).json({ message: "user-already-exists" })
	   	}
</script>
</body>
</html>
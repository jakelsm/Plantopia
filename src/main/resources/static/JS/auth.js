// 페이지 로드 시 로그인 폼 애니메이션 활성화
document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('container');
  setTimeout(() => {
    container.classList.add('sign-in');
  }, 200);

  // 로그인 실패 시 파라미터 error 검사
  if (window.location.search.includes('error')) {
    alert('아이디 또는 비밀번호가 잘못되었습니다.');
  }
});

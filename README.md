# 👨🏻‍🍳 냉장고를 열어줘 파이널 프로젝트

---

# 📌 프로젝트 설명

1. 수행기간 : 2023년 02월 28일 ~ 2023년 04월 12일
2. 개발목표 : 냉장고 재료에 알맞는 레시피 추천
3. 수행인원 : 4명

## ❓냉장고를 열어줘 란
~~~
냉장고에 뭐가 있지?! 			              
계속 열게 되는 냉장고 에너지 낭비하지 말고 냉장고 열어줘에 들어와!

재료에 알맞는 추천 레시피를 통해 고민이 필요 없는 요리! 요리에 대한 재미가 쑥쑥 커간다.

요리에 필요한 재료와 도구를 바로 구매 가능!

유익한 정보가 많은 커뮤니티로 요리에 대한 지식도 쌓여간다.

메모장에 사야 될 것, 또는 기억해야 될 재료에 관해 메모 가능! 
~~~

## 📍 팀원 소개
<div align="center">
  <img width="850" height="400" alt="스크린샷 2023-05-25 오후 7 24 22" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/ab39e2ab-810f-4642-8436-46d478eb7922">
</div>

## 📍 프로젝트 사용 기술
<div align="center">
  <img width="850" height="400" alt="스크린샷 2023-05-25 오후 7 27 05" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/8563800f-2551-42cd-b6b8-8e605607964a">
</div>

## 📍 DB설계 모델링
<div align="center">
  <img width="850" height="400" alt="스크린샷 2023-05-25 오후 7 27 05" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/2a438407-d670-480a-a332-2537f9117b19">
  <h6> 전체 DB 물리적 모델링</h6>
  
  <img width="850" height="400" alt="스크린샷 2023-05-25 오후 7 27 05" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/adf3f7be-d3e3-4b4a-9505-8ab45399d969">
  <h6> 냉장고 관리에 대한 DB설계 </h6>
  
</div>

## 📍 프로젝트 시연 UI & 설명

<div align="center">
  <p>1. 메인 페이지 시연 </p>
    <img width="850" height="400" alt="1" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/7cf51114-c86c-4e01-b67b-404836a289cd"> <br/>
    <h6> 홈페이지 메인 화면입니다. 메인화면에서 '냉장고관리' 탭 클릭시 냉장고 관리는 회원 전용으로 로그인 페이지로 이동합니다. <br/>
           메인 페이지 레시피 검색창에서 내용입력 후 엔티키 실행 시 레시피 검색 리스트로 이동되어 레시피를 편하게 볼 수 있습니다.
    </h6>
  <br/>
  
  <p>2. 홈페이지 사용 설명 </p>
    <img width="850" height="400" alt="2" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/6f344695-d3d6-442c-afb3-6ccfc2e5651a">
    <h6> 홈페이지 메인 화면입니다. 메인화면에서 홈페이지 사용방법에 대해 알려줍니다. <br/>
         모든 사용자가 홈페이지 사용방법에 대해 익히고 편하게 사용 할 수 있도록 도와줍니다.
    </h6>
  <br/>
  
  <p>3. 회원 냉장고 재료 추가 시연 </p>
    <img width="850" height="400" alt="3" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/34c6a4ed-264c-4929-b049-6ebd13f0388c">
    <h6> 회원은 '재료 리스트'에 있는 재료를 선택하면 '나의 냉장고'에 재료가 추가 되면서 선택된 재료는 글씨 색상과 밑줄로 선택 표시가 됩니다. <br/>
         '재료 리스트'에서 선택된 재료를 다시 선택시 '나의 냉장고'에서 삭제되고 원래 상태로 되돌아 옵니다. <br/>
         '나의 냉장고'는 회원마다 가지고 있으며 데이터가 유지 될 수 있도록 DB에서 불러오고 회면에 뿌려줍니다.
    </h6>
  <br/>
  <p>4. 회원 냉장고 내료 검색 시연 </p>
    <img width="850" height="400" alt="4" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/75a071cc-9916-4814-8cae-182ea7e13774">
    <h6> 재료검색창에 검색 시 input keyup이벤트를 사용하여 검색이벤트가 실행됩니다. <br/>
         '재료 리스트' 재료를 배열에 담에 일치하는 재료가 검색되도록 하였습니다.
    </h6>
  <br/>
  <p>5. 회원 냉장고 재료 삭제 시연</p>
    <img width="850" height="400" alt="5" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/d54c88fa-fbc1-41a1-9046-e4480950fe2f">
    <h6> '나의 냉장고'에 추가된 재료를 선택하면 '나의 냉장고'에서 재료가 삭제되고 원래 상태로 되돌아 옵니다. <br/>
         '재료 리스트'와 '나의 냉장고'는 무한 스크롤를 사용되어 데이터에 맞게 스크롤 됩니다.
    </h6>
  <br/>
  <p>6. 회원 냉장고 재료에 알맞는 추천 레시피 리스트 시연 </p>
    <img width="850" height="400" alt="6" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/16fd1912-0e54-4060-a098-b223e939d11f">
    <h6> '레시피 추천 받기' 버튼 클릭시 '나의 냉장고'안에 있는 재료와 알맞는 레시피를 화면에 뿌려줍니다. <br/>
          재료는 바뀔 수 있는 조건으로 foreach 를 사용하여 재료에 맞는 데이터가 검색될 수 있도록 쿼리 작성하였습니다. <br/>
          레시피사진, 제목, 칼로리를 확인하고 레시피 선택 시 레시피 상세페이지로 이동됩니다. <br/>
          화면 하단에 '냉장고 돌아가기' ,'전체 레시피 보기' 버튼을 통하여 사용자가 UI 를 편하게 이동할 수 있도록 제어 하였습니다.
    </h6>
  <br/>
  <p>7. 회원 냉장고 메모장 (내용 무) </p>
    <img width="850" height="400" alt="7" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/4a10d838-26ac-4a1f-9c43-eac5a02a6833">
    <h6> 회원은 '냉장고관리'페이지에 들어왔을때 작성된 메모가 없을 시 '메모작성' 버튼이 활성화되어 메모를 작성할 수 있도록 유도하였습니다. <br/>
          버튼 클릭시 회원 메모 데이터에 작업 내용이 실시간으로 입력, 수정, 삭제 됩니다.
    </h6>
  <br/>
  <p>8. 회원 냉장고 메모장 (내용 유) </p>
    <img width="850" height="400" alt="8" src="https://github.com/hyoozo/KH_Recipe_Project/assets/110451636/60f4a96f-d45e-4d18-8f3c-2e4e419cf447">
    <h6> 회원은 '냉장고관리' 페이지에 들어왔을때 작성된 메모가 있을 시 작성된 메모가 보여지며, 메모를 자유롭게 작성, 수정, 삭제 가능합니다.
    </h6> 

</div>

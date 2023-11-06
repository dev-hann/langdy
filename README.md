# Langdy

Clone Coding Langdy App.

## 목표

### 공통

* 모든 데이터 통신은 api 호출에 성공한 것으로 가정하고, 모든 api 호출 결과는 작업 편의에 맞는 임의의 값을 사용
* 모든 요청 사항은 작업자 판단에 따라 간소화 가능

### 목록 페이지

* 최상단 이미지 캐로셀 행 구현
* 가로 스크롤 행 구현
* 행별 ‘전체보기’ 버튼 제외

### 상세 페이지

* 참여자 후기 행 구현
* 그 외 모든 행 제외
* 예약하기 버튼/모달 구현
* 예약하기 모달에서 예약하기 누르면 현재 선택된 세션에 예약 api 호출
* 예약 성공한 경우 버튼 텍스트는 취소하기로 변경
* 예약 실패한 경우 버튼 비활성화하고 텍스트는 오류발생으로 변경

## 화면

<https://github.com/dev-hann/langdy/assets/54878755/ba269d5d-f51b-43bf-80b4-afc1762583fc>>

## 시스템 구조

* 아키텍쳐 : Clean Architecture
* 상태관리 : Provider
* 에러관리 : dartz

```text
lib
├── enum
│   └── language_type.dart
├── model
│   ├── custom_error.dart
│   ├── custom_response.dart
│   ├── town_banner.dart
│   ├── town_class.dart
│   ├── town_class_detail.dart
│   ├── town_class_schedule.dart
│   ├── town_comment.dart
│   ├── town.dart
│   └── town_page.dart
├── provider
│   ├── home_provider.dart
│   ├── town_detail_provider.dart
│   └── town_provider.dart
├── repo
│   ├── town_impl.dart
│   └── town_repo.dart
├── service
│   ├── town_service.dart
│   └── town_test_server.dart
├── use_case
│   └── town_use_case.dart
├── util
│   └── date_time_format.dart
├── view
│   ├── booking_view
│   │   ├── booking_view.dart
│   │   ├── study_view
│   │   │   └── study_view.dart
│   │   └── town_view
│   │       ├── town_all_view.dart
│   │       ├── town_class_detail_view.dart
│   │       └── town_view.dart
│   ├── community_view
│   │   └── community_view.dart
│   ├── home_view
│   │   └── home_view.dart
│   ├── user_view
│   │    └── user_view.dart
│   └── main_view.dart
├── widget
│   ├── border_button.dart
│   ├── town_banner_widget.dart
│   ├── town_booking_panel.dart
│   ├── town_class_card.dart
│   ├── town_comment_list_tile.dart
│   ├── town_horizontal_list_view.dart
│   └── wip_widget.dart
└── main.dart
```

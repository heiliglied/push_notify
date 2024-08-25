# push_notify
일정 푸시 알림이

## 사용 라이브러리.
- Go_router
- drift
- riverpod

## 디렉토리 관리.
lib - flutter 기본 루트 폴더. main entry와 routes 파일이 위치함.
lib/ui - ui 통합 폴더.
lib/ui/components - 조각낸 widget들이 모여있는 폴더.
lib/data - 데이터 바인딩 및 모델, 모델 뷰 등 실질적으로 데이터를 관리하는 service가 위치한 폴더.
lib/data/database - 데이터베이스 관련 설정. drift 설정 파일들 위치.
lib/data/database/migrations - drift에서 관리하는 table migration 파일들.

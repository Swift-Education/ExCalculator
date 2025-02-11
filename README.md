# 간단한 정수 계산기 앱

<div>
  <img src="https://github.com/user-attachments/assets/c78d8e70-3fe6-4483-bccd-bd8406691bd9" height="250">
</div>

### MVC 아키텍처 본질에 집중하여 개발
- Model, View, Controller 컴포넌트들이 각각의 역할과 책임에 집중한 객체로 설계함 [Codebase-MVC 브랜치에서 확인](https://github.com/Swift-Education/ExCalculator/tree/Codebase-MVC)
- 컴포넌트 간 통신을 delegate, KVO 패턴을 활용함
- 객체 간 결합도를 확인하기위하여 Mock 객체를 활용 하여 [테스트 코드](https://github.com/Swift-Education/ExCalculator/tree/MVC-Test) 작성함
- 각 컴포넌트의 역할과 책임 분리를 확인하기 위해 [SwiftUI를 사용하여 리팩토링](https://github.com/Swift-Education/ExCalculator/tree/refactor/SwiftUI) 진행함

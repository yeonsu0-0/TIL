import UIKit

// [참고] UTC 시간
// UTC (Coordinated Universal Time) - 협정 세계시
// 대한민국은 UTC + 9시간

Date()
// 지금 현재 시점의 Date 인스턴스 생성
// 특정 달력(양력, 음력, ...)이나 타임존에 영향을 받지않는 독립적인 시간

let now = Date()
print(now)  // 그냥 출력하는 경우 UTC 기준의 시간으로 출력 (대한민국 - 9시간)

// Date를 사용하기 위해서는 Calendar, DateFormatter에 대해 알아야 한다

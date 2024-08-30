# 2024-NC2-A13-PhotoEditing
## 🎥 Youtube Link
(추후 만들어진 유튜브 링크 추가)

## 💡 About Photo Editing

PhotoKit (Photo Editing) 에 해당하는 주요 프레임워크에는 **Photos** 와 **PhotosUI** 두 가지가 있습니다. 

### Photos Framework

- **사진 및 비디오 관리**: 사진 및 비디오를 관리하고 검색하는 기능을 제공합니다.
- **미디어 작업**: 사진 및 비디오를 추가, 삭제, 변경할 수 있습니다.
- **메타데이터 액세스**: 사진과 비디오의 메타데이터에 접근하고 수정할 수 있습니다.
- **사진 라이브러리 변화 감지**: 사용자의 사진 라이브러리에서 일어나는 변화를 감지하고 반응할 수 있습니다.

### PhotosUI Framework

- **인터페이스 구성 요소**: 사진 및 비디오를 표시하고 편집하기 위한 기본 UI를 제공합니다.
- **편집 확장**: 사용자가 사진 및 비디오를 편집할 수 있는 인터페이스를 통합할 수 있습니다.

### 차이점

- **Photos** 는 주로 사진 및 비디오를 관리하고 조작하는 기능에 중점을 둡니다.
- **PhotosUI** 는 사진 및 비디오를 표시하고 편집할 수 있는 기본 UI 요소를 제공합니다.

[PhotoKit | Apple Developer Documentation](https://developer.apple.com/documentation/photokit)

추가로는

사용자가 (종이) 포토북, 캘린더, 카드 등을 쉽게 만들 수 있는 기능을 제공할 수 있는 **Photo Project** 기능, 

앨범에 있는 사진을 선택하면 스스로 만든 편집 툴을 불러 올 수 있는 **Photo Extension** 등이 있습니다.

## 🎯 What we focus on?

이번 토픽에서는 PhotoKit 의 기능 중 사진을 넣고 저장하는 “관리 기능”에 집중하여 챌린지를 진행했습니다.

![photokit](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A13-PhotoEditing/assets/94823065/aaf5b32d-c3c7-419d-96dd-ec2b12e1ff58)

사진 관리 기능이 일반적으로 앱을 제작할 때에 가장 많이 필요로 되는 기능일 뿐만 아니라, 실제로 편집기를 제작하기 위해서는 PhotoKit 단독이 아닌 UIKit, Core Image 등 PhotoKit 이외의 기술이 필요한 것을 알게 되어 가장 기본 기능을 학습하는 것을 목적으로 했습니다.

## 💼 Use Case

이번 챌린지의 Use Case 는 아래와 같습니다.

> 기존 앨범에 있는 사진들을 이용하여 인생네컷 같은 컨셉의 프레임을 가진 재미있는 사진을 만들 수 있게 하자!
> 

오른쪽과 같은 컨셉사진을 찍기 위해서 사용자는 항상 물리적인 스튜디오에 방문해서 사진을 찍어야 하는데, 앱을 이용하여 이미 가지고 있는 재밌는 사진을 오른쪽과 같은 방식으로 표현할 수 있습니다.

## 🖼️ Prototype

![prototype1](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A13-PhotoEditing/assets/94823065/a1dc60c5-8260-4968-bc09-681b9665942e)

1. 앱 시작시 구동되는 메인 화면에서 플러스(+) 버튼을 누르면 프레임 사진을 만들 수 있는 창이 나타납니다.
2. 사진 추가 아이콘을 누르면 Photo Picker 가 나타나고, 추가할 사진을 고를 수 있습니다.
3. 사진을 선택하면 프레임에 알맞게 들어갈 수 있는 가이드 격자가 나타나고, 사진 영역을 선택할 수 있습니다.
4. 사진 영역까지 선택이 끝나면 프레임 칸에 지정한 사진이 추가되는 것을 확인할 수 있습니다.

![prototype2](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A13-PhotoEditing/assets/94823065/49029aaf-7a31-42ff-8288-bcaa8439bd9c)

5. 프레임 세 칸에 사진을 모두 추가하면 완성(Done) 버튼이 활성화됩니다.
6. 완성된 사진에 제목을 입력하고 저장(Save) 버튼을 누르면 메인 화면의 Collection 에 추가됩니다.
7. Collection 의 사진을 누르면 각 사진의 상세 화면으로 이동합니다.

![prototype3](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A13-PhotoEditing/assets/94823065/b98bc0a7-8340-4a36-b2fa-f2f042609b4b)

8. 상세 화면에서는 사진의 제목을 확인할 수 있고, 즐겨찾기 버튼을 누를 수 있습니다.
9. 즐겨찾기가 추가된 사진은 메인화면의 Favorite 항목에 추가됩니다.

![prototype4](https://github.com/DeveloperAcademy-POSTECH/2024-NC2-A13-PhotoEditing/assets/94823065/58560784-e852-41da-bfa0-5c71259cf53d)

10. 상세 화면에서 저장 버튼을 눌러 해당 이미지를 아이폰의 앨범에 저장할 수 있습니다.


## 🛠️ About Code

🔻 PhotoKit 사용에 필요한 프레임워크를 import 합니다.

```swift
import Photos
import PhotosUI
```

🔻PhotosPicker 클래스로 앨범의 사진을 선택할 수 있습니다. 선택한 사진은 selection 에 담아 사용합니다.

[PhotosPicker | Apple Developer Documentation](https://developer.apple.com/documentation/photokit/photospicker)

```swift
PhotosPicker(selection: $edit.selectedPhoto) {
                        if $edit.wrappedValue.editedImage != nil {
                            if let image = $edit.wrappedValue.editedImage {
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 319, height: 204)
                                    .clipped()
                            }
                        } else {
                            ZStack {
                                Rectangle()
                                    .frame(width: 319, height: 204)
                                    .foregroundColor(.white)
                                Image(systemName: "photo.badge.plus")
                                    .font(.system(size: 33))
                            }
                        }
                    }
```

🔻UIImageWriteToSavedPhotosAlbum 클래스를 이용하여 아이폰의 앨범에 사진을 저장합니다.

[UIImageWriteToSavedPhotosAlbum(_:_:_:_:) | Apple Developer Documentation](https://developer.apple.com/documentation/uikit/1619125-uiimagewritetosavedphotosalbum)

```swift
UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
```

🔻PHPhotoLibrary.authorizationStatus 를 이용하여 권한여부를 확인할 수 있습니다.

[PHPhotoLibrary | Apple Developer Documentation](https://developer.apple.com/documentation/photokit/phphotolibrary)

```swift
if PHPhotoLibrary.authorizationStatus(for: .addOnly) == .denied {
                            isDenied.toggle()
                        } else {
                            isSaved.toggle()
                        }
```

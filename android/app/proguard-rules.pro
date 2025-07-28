-keep class org.conscrypt.** { *; }
-keep class org.openjsse.** { *; }
-dontwarn org.conscrypt.**
-dontwarn org.openjsse.**
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**

# Retrofit 리플렉션에 필요한 어노테이션, 시그니처 등 유지
-keepattributes Signature, InnerClasses, EnclosingMethod
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
-keepattributes AnnotationDefault

# Retrofit 인터페이스 내 서비스 메서드 난독화 방지
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

# Retrofit의 Call 인터페이스 난독화 방지
-keep,allowobfuscation,allowshrinking interface retrofit2.Call
# Retrofit Response 클래스 난독화 방지
-keep,allowobfuscation,allowshrinking class retrofit2.Response

# Kotlin 코루틴 Continuation 클래스 난독화 방지
-keep,allowobfuscation,allowshrinking class kotlin.coroutines.Continuation
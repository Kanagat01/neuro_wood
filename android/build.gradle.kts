plugins {
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
    id("com.google.gms.google-services") version "4.3.15" apply false
    id("com.google.firebase.crashlytics") version "3.0.4" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 📁 Настройка пользовательской директории сборки
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// 🧹 Команда очистки
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

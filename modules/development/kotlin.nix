{pkgs, ...}:
let 
  javaVersion = 21;
  java = pkgs."jdk${toString javaVersion}";
  gradle = pkgs.gradle.override { inherit java; };
  kotlin = pkgs.kotlin.override { jre = java; };  
in {
  environment.systemPackages = with pkgs; [
    java
    gradle
    kotlin
    kotlin-language-server
  ];
}

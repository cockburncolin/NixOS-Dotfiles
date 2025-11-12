{pkgs, ...}:
let 
  javaVersion = 21;
  java = pkgs."openjdk-${javaVersion}";
  gradle = pkgs.gradle.override { inherit java; };
  kotlin = pkgs.kotlin.override { jre = java; };  
in {
  environment.systemPackages = with pkgs; [
    gradle
    kotlin
    kotlin-language-server
  ];
}

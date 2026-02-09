#!/bin/bash

# ================= HCO-CEH-VERSE v3 ULTIMATE =================
# Ethical Hacking Learning Framework for Termux (Android)
# Developer: Hackers Colony Tech
# YouTube: https://youtube.com/@hackers_colony_tech?si=nrmAMrxxffy_AxFI

# ================= COLORS =================
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
P='\033[1;35m'
C='\033[1;36m'
W='\033[0m'

YT_URL="https://youtube.com/@hackers_colony_tech?si=nrmAMrxxffy_AxFI"
DATA="$HOME/.hco_ceh_progress"

# ================= AUTO DEPENDENCIES =================
deps=(figlet toilet git curl wget python php nmap openssh)
for d in "${deps[@]}"; do
  command -v $d >/dev/null 2>&1 || pkg install $d -y
done

# ================= PROGRESS SYSTEM =================
[ ! -f "$DATA" ] && echo "LEVEL=1;XP=0" > "$DATA"
source "$DATA"

save_progress() {
  echo "LEVEL=$LEVEL;XP=$XP" > "$DATA"
}

gain_xp() {
  XP=$((XP+15))
  if [ $XP -ge 100 ]; then
    LEVEL=$((LEVEL+1))
    XP=0
    echo -e "$G\n🎉 LEVEL UP → LEVEL $LEVEL 🎉\n"
    sleep 1
  fi
  save_progress
}

# ================= LOADER =================
loader() {
  for i in {1..3}; do
    echo -ne "$C Initializing System$i...\r"
    sleep 0.4
  done
  echo ""
}

# ================= YOUTUBE LOCK + COUNTDOWN =================
clear
echo -e "$R"
figlet LOCKED
echo -e "$Y HCO-CEH-Verse Protected Framework"
echo -e "$C Please support official channel to continue"
echo -e "$W"

for i in 7 6 5 4 3 2 1; do
  echo -e "$G Opening YouTube App in $i seconds..."
  sleep 1
done

# Directly open YouTube App
am start -a android.intent.action.VIEW -d "$YT_URL" >/dev/null 2>&1
sleep 2

# ================= BANNER =================
banner() {
  clear
  echo -e "$C"
  figlet HCO
  echo -e "$P      CEH   VERSE  v3"
  echo -e "$Y ULTIMATE Ethical Hacking Learning Framework"
  echo -e "$B -----------------------------------------------"
  echo -e "$G Developer : Hackers Colony Tech"
  echo -e "$G Level : $LEVEL   XP : $XP/100"
  echo -e "$B -----------------------------------------------"
  echo -e "$W"
}

# ================= DAILY CHALLENGE =================
daily_challenge() {
  clear
  figlet CHALLENGE
  echo -e "$Y Today's Hacker Challenge:"
  echo
  echo -e "$C • Learn Nmap scanning modes"
  echo -e "$C • Run: nmap scanme.nmap.org"
  echo -e "$C • Understand open ports & services"
  echo
  echo -e "$G Reward: +15 XP"
  gain_xp
  read -p " Press Enter..."
}

# ================= PRACTICE LAB GUIDE =================
practice_labs() {
  clear
  figlet LABS
  echo -e "$Y Recommended Legal Practice Platforms:"
  echo
  echo -e "$C • TryHackMe"
  echo -e "$C • Hack The Box (Academy)"
  echo -e "$C • PortSwigger Web Security Academy"
  echo
  echo -e "$G Only practice on legal labs & authorized targets."
  gain_xp
  read -p " Press Enter..."
}

# ================= TOOL INSTALLER =================
tool_installer() {
  while true; do
    clear
    figlet TOOLS
    echo -e "$Y Professional Tools Installer"
    echo
    echo -e "$C [1] Nmap"
    echo -e "$C [2] SQLMap"
    echo -e "$C [3] Red Hawk"
    echo -e "$C [4] Subfinder"
    echo -e "$C [5] Metasploit (basic install)"
    echo -e "$C [6] Back"
    echo
    read -p " Choose ➜ " t

    case $t in
      1) loader; pkg install nmap -y ;;
      2) loader; git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git ;;
      3) loader; git clone https://github.com/Tuhinshubhra/RED_HAWK ;;
      4) loader; wget https://github.com/projectdiscovery/subfinder/releases/latest/download/subfinder_0.6.5_linux_arm64.zip ;;
      5) loader; pkg install unstable-repo -y && pkg install metasploit -y ;;
      6) break ;;
      *) echo -e "$R Invalid option"; sleep 1 ;;
    esac

    echo -e "$G Tool setup complete! +15 XP"
    gain_xp
    sleep 1
  done
}

# ================= MAIN MENU =================
while true; do
  banner
  echo -e "$R [1]$C Ethical Hacking Introduction"
  echo -e "$R [2]$G Master Learning Roadmap"
  echo -e "$R [3]$Y Advanced Tools Installer"
  echo -e "$R [4]$P Bug Bounty Career Path"
  echo -e "$R [5]$B Hacker Mindset Training"
  echo -e "$R [6]$C Daily Challenge Mode"
  echo -e "$R [7]$G Practice Labs Guide"
  echo -e "$R [8]$R Exit"
  echo

  read -p " Select ➜ " ch

  case $ch in

  1)
    clear
    figlet INTRO
    echo -e "$C Ethical hacking = Authorized cybersecurity testing"
    echo
    echo -e "$Y Purpose:"
    echo -e "$G • Identify vulnerabilities"
    echo -e "$G • Improve security posture"
    echo -e "$G • Protect digital assets"
    echo
    gain_xp
    read -p " Press Enter..."
    ;;

  2)
    clear
    figlet ROADMAP
    echo -e "$Y 6-Month Professional Plan"
    echo
    echo -e "$C Month 1 → Linux + Networking"
    echo -e "$C Month 2 → Recon + OSINT"
    echo -e "$C Month 3 → Web Security + OWASP"
    echo -e "$C Month 4 → Scripting + Automation"
    echo -e "$C Month 5 → Bug Bounty + Labs"
    echo -e "$C Month 6 → Red Team Basics"
    echo
    gain_xp
    read -p " Press Enter..."
    ;;

  3) tool_installer ;;

  4)
    clear
    figlet BUG
    echo -e "$Y Bug Bounty Career Path"
    echo
    echo -e "$C Step 1 → Web Basics"
    echo -e "$C Step 2 → OWASP Top 10"
    echo -e "$C Step 3 → Labs Practice"
    echo -e "$C Step 4 → Recon Automation"
    echo -e "$C Step 5 → Responsible Disclosure"
    echo
    echo -e "$G Platforms:"
    echo -e "$Y HackerOne • Bugcrowd • Intigriti"
    gain_xp
    read -p " Press Enter..."
    ;;

  5)
    clear
    figlet MINDSET
    echo -e "$Y Elite Hacker Thinking"
    echo
    echo -e "$C • Curiosity"
    echo -e "$C • Logical analysis"
    echo -e "$C • Persistence"
    echo -e "$C • Automation mindset"
    echo
    gain_xp
    read -p " Press Enter..."
    ;;

  6) daily_challenge ;;

  7) practice_labs ;;

  8)
    clear
    echo -e "$R Exiting HCO-CEH-Verse..."
    sleep 1
    exit
    ;;

  *)
    echo -e "$R Invalid Option"
    sleep 1
    ;;

  esac
done

# MOTIVATE U 

Clear-Host
$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

function Play-Sound($type) {
    if ($type -eq "soft") {
        [console]::beep(600,200)
        [console]::beep(800,200)
    }
    elseif ($type -eq "strong") {
        [console]::beep(800,200)
        [console]::beep(1000,200)
        [console]::beep(1200,200)
    }
    elseif ($type -eq "calm") {
        [console]::beep(500,300)
        [console]::beep(400,300)
    }
}

function Show-Message($bg, $fg, $label, $symbol, $messages, $challenge, $heavyMood) {
    $Host.UI.RawUI.BackgroundColor = $bg
    $Host.UI.RawUI.ForegroundColor = $fg
    Clear-Host

    $message = Get-Random -InputObject $messages

    Write-Host ""
    Write-Host "======================================================"
    Write-Host "$symbol  MOOD: $label  $symbol"
    Write-Host "======================================================"
    Write-Host ""
    Write-Host $message
    Write-Host ""

    Write-Host "DAILY CHALLENGE:" -ForegroundColor Yellow
    Write-Host $challenge
    Write-Host ""

    if ($heavyMood -eq $true) {
        Write-Host "IMPORTANT SUPPORT MESSAGE:" -ForegroundColor Yellow
        Write-Host "If you feel unsafe, overwhelmed, or like you may hurt yourself, please reach out to someone you trust right now."
        Write-Host "If you are in immediate danger, contact emergency services or a crisis hotline in your area."
        Write-Host ""
    }
}

$name = Read-Host "Please enter your name"

do {
    Clear-Host
    $Host.UI.RawUI.BackgroundColor = "Black"
    $Host.UI.RawUI.ForegroundColor = "White"
    Clear-Host

    Write-Host "======================================================"
    Write-Host "                     MOTIVATE U                       "
    Write-Host "======================================================"
    Write-Host ""
    Write-Host "Hello, $name! Welcome back to MOTIVATE U."
    Write-Host ""

    $moods = @{
        "1"="Sad"; "2"="Happy"; "3"="Angry"; "4"="Anxious"; "5"="Tired"
        "6"="Lonely"; "7"="Confused"; "8"="Stressed"; "9"="Fearful"; "10"="Unmotivated"
        "11"="Grateful"; "12"="Hopeful"; "13"="Heartbroken"; "14"="Overwhelmed"; "15"="Confident"
    }

    Write-Host "How are you feeling today?"
    Write-Host ""

    foreach ($key in $moods.Keys | Sort-Object {[int]$_}) {
        Write-Host "$key. $($moods[$key])"
    }

    $validMood = $false

    while ($validMood -eq $false) {
        Write-Host ""
        $choice = Read-Host "Choose a number or type your mood"
        $moodInput = $choice.ToLower().Trim()

        if ($moods.ContainsKey($choice)) {
            $moodInput = $moods[$choice].ToLower()
        }

        $sadWords = @("sad","down","depressed","blue","unhappy","gloomy","miserable","broken","hurt")
        $happyWords = @("happy","joyful","excited","cheerful","good","great","amazing")
        $angryWords = @("angry","mad","furious","frustrated","annoyed","irritated")
        $anxiousWords = @("anxious","nervous","worried","panic","panicked","uneasy")
        $tiredWords = @("tired","exhausted","drained","sleepy","burnt out","weary")
        $lonelyWords = @("lonely","alone","isolated","forgotten")
        $confusedWords = @("confused","lost","uncertain","unsure")
        $stressedWords = @("stressed","pressured","overworked","tense")
        $fearfulWords = @("fearful","afraid","scared","frightened")
        $unmotivatedWords = @("unmotivated","lazy","stuck","discouraged")
        $gratefulWords = @("grateful","thankful","blessed")
        $hopefulWords = @("hopeful","optimistic","encouraged")
        $heartbrokenWords = @("heartbroken","brokenhearted","rejected","devastated")
        $overwhelmedWords = @("overwhelmed","buried","swamped","drowning")
        $confidentWords = @("confident","strong","powerful","brave")

        if ($sadWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "Black" "White" "Sad / Down / Hurt" "[RAIN]" @(
"$name... I know this feels heavy. But this is not the end of your story. You are still breathing, still standing, and still capable of rising from this moment.",
"$name... sadness may be sitting with you right now, but it does not own you. You have survived hard days before, and you have strength still waiting inside you.",
"$name... let yourself feel what you feel, but do not let pain convince you that you are powerless. You are healing, growing, and still moving forward."
            ) "Write down one thing you survived before and remind yourself: I made it through that, and I can make it through this." $true
        }
        elseif ($happyWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "strong"
            Show-Message "White" "Black" "Happy / Joyful / Excited" "[SUN]" @(
"$name... protect this joy. Let it remind you that life still has light, beauty, and moments worth celebrating.",
"$name... happiness looks good on you. Do not shrink it. Enjoy it, share it, and let it fuel your next step.",
"$name... this joy is proof that better moments are real. Hold onto it and let it strengthen your heart."
            ) "Share your joy with one person today, even if it is just a smile, message, or kind word." $false
        }
        elseif ($angryWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "strong"
            Show-Message "Black" "Yellow" "Angry / Mad / Frustrated" "[FIRE]" @(
"$name... anger is energy. Do not let it control you. Use it to build boundaries, discipline, and a stronger version of yourself.",
"$name... you do not need revenge. You need direction. Turn that fire into focus and let your growth speak louder than your pain.",
"$name... your frustration is real, but it does not have to destroy your peace. Breathe, choose wisely, and move with power."
            ) "Before reacting, take 10 slow breaths and write down what you actually need right now." $false
        }
        elseif ($anxiousWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "DarkGray" "White" "Anxious / Nervous / Worried" "[BREATH]" @(
"$name... breathe. Not every thought deserves your trust. Not every fear is telling the truth. You are safe in this moment.",
"$name... you do not have to solve your whole life today. Focus on the next breath, the next choice, and the next small step.",
"$name... anxiety may be loud, but you are stronger than the noise. Slow down. Come back to this moment. You can handle this."
            ) "Take 5 deep breaths, then name 3 things you can see, 2 things you can touch, and 1 thing you can control." $false
        }
        elseif ($tiredWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "soft"
            Show-Message "Black" "Gray" "Tired / Exhausted / Drained" "[REST]" @(
"$name... rest is not weakness. You are allowed to pause. Even strong people need time to recover.",
"$name... being tired means you have been trying. Give yourself permission to recharge without guilt.",
"$name... you do not have to prove your strength by running on empty. Rest, breathe, and rise again."
            ) "Take a real break today, even if it is only 10 quiet minutes with no pressure." $false
        }
        elseif ($lonelyWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "soft"
            Show-Message "DarkBlue" "White" "Lonely / Alone / Isolated" "[STAR]" @(
"$name... you may feel alone, but you are not invisible. Your life matters more than this lonely moment is telling you.",
"$name... loneliness can lie. It can make you feel forgotten, but your presence has value.",
"$name... this quiet season does not mean you are unloved. It may be a moment to reconnect with yourself and remember your worth."
            ) "Reach out to one person today, even with a simple message that says, 'I was thinking about you.'" $false
        }
        elseif ($confusedWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "soft"
            Show-Message "DarkMagenta" "White" "Confused / Lost / Unsure" "[COMPASS]" @(
"$name... confusion does not mean failure. It means you are searching for clarity, and clarity often comes one step at a time.",
"$name... you do not need the whole map today. You only need the next right step.",
"$name... being unsure is part of growing. Keep asking, keep learning, and keep moving."
            ) "Write down the one question you most need answered, then choose one small step toward finding that answer." $false
        }
        elseif ($stressedWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "DarkGray" "Yellow" "Stressed / Pressured / Tense" "[PRESSURE]" @(
"$name... you do not have to carry the whole mountain at once. Break it down. One task, one breath, one step.",
"$name... stress can make everything look impossible, but you are capable of handling this piece by piece.",
"$name... slow down. You are not failing. You are human, and you can choose what matters first."
            ) "Pick only one task to finish first. Do not worry about everything else until that one thing is done." $false
        }
        elseif ($fearfulWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "Black" "Cyan" "Fearful / Afraid / Scared" "[COURAGE]" @(
"$name... courage is not the absence of fear. Courage is moving forward while fear is still speaking.",
"$name... fear can come with you, but it does not get to lead you. Your future is bigger than this fear.",
"$name... you do not have to feel fearless to take the next step. You only have to decide not to quit."
            ) "Do one small thing today that fear has been trying to talk you out of." $true
        }
        elseif ($unmotivatedWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "strong"
            Show-Message "Blue" "White" "Unmotivated / Stuck / Discouraged" "[SPARK]" @(
"$name... motivation may fade, but discipline can carry you. Start small. One action today can change tomorrow.",
"$name... do it tired. Do it unsure. Do it imperfect. Starting is what creates momentum.",
"$name... your future is built by what you do today, not what you promise tomorrow."
            ) "Set a timer for 5 minutes and work on one thing. When the timer ends, you have already won momentum." $false
        }
        elseif ($gratefulWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "soft"
            Show-Message "White" "Black" "Grateful / Thankful / Blessed" "[THANKS]" @(
"$name... gratitude is strength. It helps you see light even when life is not perfect.",
"$name... hold onto that thankful heart. It will keep you grounded, humble, and hopeful.",
"$name... every breath, every lesson, and every blessing is proof that life still has beauty."
            ) "Write down 3 things you are grateful for today, no matter how small." $false
        }
        elseif ($hopefulWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "soft"
            Show-Message "DarkCyan" "White" "Hopeful / Optimistic / Encouraged" "[LIGHT]" @(
"$name... hope is power. It is the part of you that believes your current situation is not your final situation.",
"$name... protect that hope. Feed it with action, faith, and courage.",
"$name... better days are possible. Keep walking toward them, one step at a time."
            ) "Do one thing today that your future self will thank you for." $false
        }
        elseif ($heartbrokenWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "Black" "Magenta" "Heartbroken / Rejected / Devastated" "[HEAL]" @(
"$name... your heart may be wounded, but it is still beating. That means healing is still possible.",
"$name... what broke your heart does not get to break your future. You are still valuable and worthy of peace.",
"$name... let yourself grieve, but do not build a home inside the pain. Healing will come one day at a time."
            ) "Do one gentle thing for yourself today: rest, journal, pray, walk, or talk to someone safe." $true
        }
        elseif ($overwhelmedWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "calm"
            Show-Message "DarkBlue" "Yellow" "Overwhelmed / Buried / Swamped" "[ANCHOR]" @(
"$name... stop and breathe. You do not have to fix everything in this one moment.",
"$name... when life feels too heavy, focus only on what is directly in front of you.",
"$name... you are not weak because you feel overwhelmed. You are human, and you can regain control one choice at a time."
            ) "Write down everything on your mind, then circle only the first thing you will handle." $true
        }
        elseif ($confidentWords -contains $moodInput) {
            $validMood = $true
            Play-Sound "strong"
            Show-Message "White" "Black" "Confident / Strong / Brave" "[POWER]" @(
"$name... stand tall. You have earned the right to believe in yourself.",
"$name... confidence is remembering who you are after life tried to make you forget.",
"$name... walk like your voice matters, move like your future is waiting, and keep becoming who you were meant to be."
            ) "Use your confidence to encourage one other person today." $false
        }
        else {
            Write-Host ""
            Write-Host "I did not recognize that mood. Please choose a number from 1 to 15 or type one of the listed moods." -ForegroundColor Yellow
            Play-Sound "soft"
        }
    }

    Write-Host "======================================================"
    Write-Host "Thank you for using MOTIVATE U!"
    Write-Host "Remember: keep moving forward, one foot in front of the other."
    Write-Host "One step, one fight, one victory at a time."
    Write-Host "======================================================"
    Write-Host ""

    $restart = Read-Host "Would you like to use MOTIVATE U again? (Y/N)"

} while ($restart.ToLower() -eq "y")

$Host.UI.RawUI.BackgroundColor = "Black"
$Host.UI.RawUI.ForegroundColor = "White"
Clear-Host

Write-Host "Goodbye from MOTIVATE U!"
Write-Host "Stay strong. Keep going. Your story is not over."
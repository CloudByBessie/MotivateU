# ======================================================
# MOTIVATE U
# Created by Bessie Mullins
# Version 2.0 - Windows Forms App
# Copyright (c) 2026 Bessie Mullins
# ======================================================

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

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

$moodData = @{
    "Sad" = @{
        Color = [System.Drawing.Color]::Black
        TextColor = [System.Drawing.Color]::White
        Symbol = "[RAIN]"
        Sound = "calm"
        Heavy = $true
        Challenge = "Write down one thing you survived before and remind yourself: I made it through that, and I can make it through this."
        Messages = @(
            "I know this feels heavy right now, and I know sadness can make everything around you feel darker than it really is. But this moment is not the end of your story. You are still breathing, still standing, and still capable of rising from this place. Let yourself feel what you feel, but do not let pain convince you that you are powerless. You have survived hard days before, and there is still strength inside you that has not given up.",
            "Sadness may be sitting with you today, but it does not own you. It may feel loud, heavy, and personal, but it is still only one part of your journey, not the whole picture. You are allowed to cry, rest, and be honest about what hurts, but you are also allowed to believe that better days are still possible. Keep going gently, one breath and one step at a time.",
            "Your heart may feel tired, but your life still has meaning. This dark moment is not proof that you are weak; it is proof that you have been carrying something heavy. You do not have to fix everything today. Just keep choosing not to quit, because healing can begin quietly, and even small steps forward still count as progress."
        )
    }

    "Happy" = @{
        Color = [System.Drawing.Color]::White
        TextColor = [System.Drawing.Color]::Black
        Symbol = "[SUN]"
        Sound = "strong"
        Heavy = $false
        Challenge = "Share your joy with one person today, even if it is just a smile, message, or kind word."
        Messages = @(
            "Protect this joy and do not shrink it for anyone. Happiness is not something you need to apologize for, especially when you have made it through difficult seasons. Let this moment remind you that life still has beauty, light, laughter, and reasons to keep believing. Enjoy this feeling fully and let it give you energy for what comes next.",
            "Happiness looks good on you, and you deserve to feel it without guilt. Let yourself smile, celebrate, and breathe in the goodness of this moment. Life will not always be perfect, but moments like this prove that joy is still real and still possible. Carry it with confidence and let it brighten the people around you.",
            "This joy is proof that better moments are real. Hold onto it, not because every day will feel easy, but because your heart needs reminders that good things can still happen. Let this happiness strengthen your faith, lift your spirit, and remind you that you are allowed to enjoy the life you are building."
        )
    }

    "Angry" = @{
        Color = [System.Drawing.Color]::Black
        TextColor = [System.Drawing.Color]::Yellow
        Symbol = "[FIRE]"
        Sound = "strong"
        Heavy = $false
        Challenge = "Before reacting, take 10 slow breaths and write down what you actually need right now."
        Messages = @(
            "Anger is powerful energy, but you get to decide what it becomes. Do not let it control your mouth, your actions, or your future. Instead, use it to understand what boundary was crossed, what pain needs attention, and what change needs to happen. You do not have to explode to be strong; sometimes real strength is pausing, breathing, and choosing your response with wisdom.",
            "You may be angry because something hurt you, disrespected you, or pushed you beyond what felt fair. That feeling is real, but it does not have to destroy your peace. Turn that fire into focus. Let it help you build discipline, boundaries, courage, and a stronger version of yourself. You do not need revenge; you need direction.",
            "Your frustration is valid, but it does not have to become your identity. You can feel anger without letting anger lead you. Take a step back, breathe deeply, and choose power over chaos. When you control the fire instead of letting the fire control you, you become stronger, wiser, and harder to break."
        )
    }

    "Anxious" = @{
        Color = [System.Drawing.Color]::DimGray
        TextColor = [System.Drawing.Color]::White
        Symbol = "[BREATH]"
        Sound = "calm"
        Heavy = $false
        Challenge = "Take 5 deep breaths, then name 3 things you can see, 2 things you can touch, and 1 thing you can control."
        Messages = @(
            "Breathe and come back to this moment. Anxiety can make your mind race ahead into problems that have not happened yet, but not every thought deserves your trust. You do not have to solve your whole life today. Focus on your next breath, your next choice, and the next small thing you can control. You are safe enough to slow down right now.",
            "You are not weak because you feel anxious. Your mind may be loud, but that does not mean fear is telling the truth. You have handled uncertain moments before, and you can handle this one too. Let your shoulders relax, take your time, and remind yourself that this feeling is temporary, even if it feels intense right now.",
            "Anxiety may be trying to convince you that everything is urgent, dangerous, or impossible, but you do not have to obey every alarm your mind creates. Slow down and separate facts from fears. One steady breath can become one steady thought, and one steady thought can help you take one steady step forward."
        )
    }

    "Tired" = @{
        Color = [System.Drawing.Color]::Black
        TextColor = [System.Drawing.Color]::LightGray
        Symbol = "[REST]"
        Sound = "soft"
        Heavy = $false
        Challenge = "Take a real break today, even if it is only 10 quiet minutes with no pressure."
        Messages = @(
            "Rest is not weakness, and needing a pause does not mean you are failing. You have been carrying responsibilities, emotions, thoughts, and pressure that may not always be visible to others. Give yourself permission to slow down without guilt. You are still strong, even when you are tired, and rest may be exactly what helps you rise again.",
            "Being tired means you have been trying, pushing, surviving, and showing up. You do not have to prove your worth by running on empty. A tired body and a tired mind need care, not criticism. Take a breath, give yourself space, and remember that recovery is part of progress too.",
            "You are allowed to pause. You are allowed to admit that you need rest. Life may demand a lot from you, but you are not a machine. Recharging does not erase your strength; it protects it. Take care of yourself today so that tomorrow you can continue with a clearer mind and a stronger heart."
        )
    }

    "Lonely" = @{
        Color = [System.Drawing.Color]::DarkBlue
        TextColor = [System.Drawing.Color]::White
        Symbol = "[STAR]"
        Sound = "soft"
        Heavy = $false
        Challenge = "Reach out to one person today, even with a simple message that says, 'I was thinking about you.'"
        Messages = @(
            "You may feel alone right now, but you are not invisible. Loneliness can make you believe that nobody sees you or cares, but that feeling is not the full truth. Your life matters, your presence matters, and your story matters. This quiet moment does not erase your value or your ability to connect again.",
            "Loneliness can lie to you and make you feel forgotten, but you are still worthy of love, friendship, kindness, and belonging. Sometimes connection starts with one small step, one message, or one honest conversation. Do not let this lonely season convince you that you are meant to stay alone.",
            "This quiet season does not mean you are unloved. It may simply mean your heart is craving connection, understanding, and comfort. Be gentle with yourself, and do not be afraid to reach out. You deserve people who see you, hear you, and remind you that you matter."
        )
    }

    "Confused" = @{
        Color = [System.Drawing.Color]::Purple
        TextColor = [System.Drawing.Color]::White
        Symbol = "[COMPASS]"
        Sound = "soft"
        Heavy = $false
        Challenge = "Write down the one question you most need answered, then choose one small step toward finding that answer."
        Messages = @(
            "Confusion does not mean failure. It means you are searching for clarity, and searching is part of growth. You do not need the entire map today. Sometimes the path becomes clearer only after you take the first step. Trust yourself enough to move carefully, learn as you go, and adjust when needed.",
            "You may not have every answer right now, and that is okay. Being unsure does not mean you are lost forever; it means you are in the middle of figuring something out. Slow down, ask questions, gather wisdom, and focus on the next right step instead of the whole journey at once.",
            "Confusion can feel frustrating, but it can also be a sign that you are growing beyond where you used to be. Give yourself time to think, learn, and understand. Clarity often comes through patience, reflection, and action. Keep moving forward gently, and the direction will begin to reveal itself."
        )
    }

    "Stressed" = @{
        Color = [System.Drawing.Color]::DimGray
        TextColor = [System.Drawing.Color]::Yellow
        Symbol = "[PRESSURE]"
        Sound = "calm"
        Heavy = $false
        Challenge = "Pick only one task to finish first. Do not worry about everything else until that one thing is done."
        Messages = @(
            "You do not have to carry the whole mountain at once. Stress can make everything feel urgent, heavy, and impossible, but you are allowed to break things down. Take one breath, choose one task, and handle one piece at a time. Progress does not have to happen all at once to be real.",
            "Stress may be telling you that you are falling behind, but feeling pressured does not mean you are failing. You are human, and you are dealing with a lot. Slow down long enough to decide what matters most right now. When you focus on one thing at a time, the weight becomes easier to manage.",
            "This pressure is real, but so is your ability to move through it. You can organize the chaos, ask for help, set limits, and take the next step. Do not let stress convince you that you are powerless. You are capable of handling this piece by piece, even if you need to move slowly."
        )
    }

    "Fearful" = @{
        Color = [System.Drawing.Color]::Black
        TextColor = [System.Drawing.Color]::Cyan
        Symbol = "[COURAGE]"
        Sound = "calm"
        Heavy = $true
        Challenge = "Do one small thing today that fear has been trying to talk you out of."
        Messages = @(
            "Courage is not the absence of fear. Courage is choosing to move forward while fear is still speaking. You do not have to feel fearless to take the next step. Fear may walk beside you, but it does not get to lead you. Your future is bigger than the thing trying to scare you.",
            "Fear can make you want to stop, hide, or doubt yourself, but it does not get the final word. You have faced uncertainty before, and you have made it through more than you realize. Take one small brave step today, not because it is easy, but because you deserve to keep growing.",
            "You are allowed to be afraid and brave at the same time. Fear may be loud, but your strength is still present. Take your time, breathe deeply, and remind yourself that you do not need to conquer everything today. One courageous step is enough to prove that fear is not in control."
        )
    }

    "Unmotivated" = @{
        Color = [System.Drawing.Color]::RoyalBlue
        TextColor = [System.Drawing.Color]::White
        Symbol = "[SPARK]"
        Sound = "strong"
        Heavy = $false
        Challenge = "Set a timer for 5 minutes and work on one thing. When the timer ends, you have already won momentum."
        Messages = @(
            "Motivation may fade, but discipline can carry you when feelings do not show up. You do not have to feel ready to begin. Start small, start messy, start tired, but start. One small action can create momentum, and momentum can remind you that you are still capable of moving forward.",
            "You are not stuck forever. You may simply be waiting for motivation when what you really need is one small decision. Do not pressure yourself to change everything today. Choose one thing and give it five honest minutes. That small effort can become the spark that gets you moving again.",
            "Your future is built by what you do today, not by what you promise tomorrow. Even when you feel unmotivated, you can still take one small step. Do it imperfectly. Do it slowly. Do it anyway. Progress begins when you stop waiting for the perfect feeling and choose action."
        )
    }

    "Grateful" = @{
        Color = [System.Drawing.Color]::White
        TextColor = [System.Drawing.Color]::Black
        Symbol = "[THANKS]"
        Sound = "soft"
        Heavy = $false
        Challenge = "Write down 3 things you are grateful for today, no matter how small."
        Messages = @(
            "Gratitude is strength because it helps you notice what is still good, even when life is not perfect. Being grateful does not mean ignoring your struggles; it means choosing to recognize the blessings, lessons, and moments of light that are still present. Let thankfulness keep you grounded and hopeful today.",
            "Hold onto that thankful heart. Gratitude can change the way you see your day, your challenges, and your progress. Every breath, every lesson, every small blessing is proof that life still carries beauty. Let your gratitude remind you that even ordinary moments can have meaning.",
            "When you choose gratitude, you train your heart to recognize light. You begin to see that not everything has to be perfect for life to still be meaningful. Let this thankful spirit guide your attitude today and help you move with peace, humility, and appreciation."
        )
    }

    "Hopeful" = @{
        Color = [System.Drawing.Color]::DarkCyan
        TextColor = [System.Drawing.Color]::White
        Symbol = "[LIGHT]"
        Sound = "soft"
        Heavy = $false
        Challenge = "Do one thing today that your future self will thank you for."
        Messages = @(
            "Hope is power. It is the part of you that refuses to believe your current situation is your final situation. Protect that light inside you, even if it feels small. Small hope can still lead you through dark places, and every step you take toward better days matters.",
            "Hold onto hope, because hope gives your heart somewhere to go. You may not see the full picture yet, but that does not mean better things are not forming. Keep walking, keep believing, and keep doing what you can. Your effort today can become the doorway to a stronger tomorrow.",
            "Better days are possible, even if today still feels uncertain. Hope does not mean pretending everything is easy; it means believing that change, healing, growth, and new opportunities are still possible. Let that belief guide your next step and keep your heart open to what is ahead."
        )
    }

    "Heartbroken" = @{
        Color = [System.Drawing.Color]::Black
        TextColor = [System.Drawing.Color]::Magenta
        Symbol = "[HEAL]"
        Sound = "calm"
        Heavy = $true
        Challenge = "Do one gentle thing for yourself today: rest, journal, pray, walk, or talk to someone safe."
        Messages = @(
            "Your heart may be wounded, but it is still beating, and that means healing is still possible. What hurt you does not get to define your worth or decide your future. Let yourself grieve, but do not build a permanent home inside the pain. You are still valuable, still lovable, and still worthy of peace.",
            "Heartbreak can make the world feel smaller and make breathing feel harder, but this pain will not always feel this sharp. You do not have to rush your healing or pretend you are fine. Be gentle with yourself. One day, you will smile without forcing it, and this hurt will no longer have the same power over you.",
            "What broke your heart does not get to break your future. Loss, rejection, or disappointment may hurt deeply, but they do not erase who you are. You are still whole enough to heal, still strong enough to continue, and still worthy of love that is safe, honest, and kind."
        )
    }

    "Overwhelmed" = @{
        Color = [System.Drawing.Color]::DarkBlue
        TextColor = [System.Drawing.Color]::Yellow
        Symbol = "[ANCHOR]"
        Sound = "calm"
        Heavy = $true
        Challenge = "Write down everything on your mind, then circle only the first thing you will handle."
        Messages = @(
            "Stop and breathe. You do not have to fix everything in this one moment. Overwhelm can make life feel too loud, too heavy, and too much all at once, but you are allowed to slow down. Choose one thing, one breath, one step. That is enough for right now.",
            "When life feels too heavy, focus only on what is directly in front of you. You are not weak because you feel overwhelmed; you are human, and you may be carrying more than your mind can organize at once. Put the pressure down piece by piece and begin with one small action.",
            "You can regain control one choice at a time. You do not need to handle the whole list, solve every problem, or answer every question right now. Anchor yourself in the present moment, breathe deeply, and choose the first thing you can do. Small order can grow from small action."
        )
    }

    "Confident" = @{
        Color = [System.Drawing.Color]::White
        TextColor = [System.Drawing.Color]::Black
        Symbol = "[POWER]"
        Sound = "strong"
        Heavy = $false
        Challenge = "Use your confidence to encourage one other person today."
        Messages = @(
            "Stand tall. You have earned the right to believe in yourself. You have survived things that tested you, learned lessons that shaped you, and grown through moments that could have stopped you. Do not shrink now. Walk like your voice matters, because it does.",
            "Confidence is not arrogance; it is remembering who you are after life tried to make you forget. Carry yourself with purpose today. Speak with strength, move with intention, and keep becoming the person you know you are capable of being. You do not have to be perfect to be powerful.",
            "There is power in you, and today you can choose to use it well. Let your confidence lead you into action, kindness, courage, and leadership. Believe in the work you have done to become who you are, and keep showing up for the person you are still becoming."
        )
    }
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "MOTIVATE U"
$form.Size = New-Object System.Drawing.Size(900, 700)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::Black
$form.ForeColor = [System.Drawing.Color]::White

$title = New-Object System.Windows.Forms.Label
$title.Text = "MOTIVATE U"
$title.Font = New-Object System.Drawing.Font("Arial", 28, [System.Drawing.FontStyle]::Bold)
$title.Size = New-Object System.Drawing.Size(850, 45)
$title.Location = New-Object System.Drawing.Point(20, 20)
$title.TextAlign = "MiddleCenter"
$form.Controls.Add($title)

$creator = New-Object System.Windows.Forms.Label
$creator.Text = "Created by Bessie Mullins"
$creator.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Italic)
$creator.Size = New-Object System.Drawing.Size(850, 25)
$creator.Location = New-Object System.Drawing.Point(20, 65)
$creator.TextAlign = "MiddleCenter"
$form.Controls.Add($creator)

$nameLabel = New-Object System.Windows.Forms.Label
$nameLabel.Text = "Enter your name:"
$nameLabel.Font = New-Object System.Drawing.Font("Arial", 12)
$nameLabel.Size = New-Object System.Drawing.Size(150, 25)
$nameLabel.Location = New-Object System.Drawing.Point(30, 105)
$form.Controls.Add($nameLabel)

$nameBox = New-Object System.Windows.Forms.TextBox
$nameBox.Font = New-Object System.Drawing.Font("Arial", 12)
$nameBox.Size = New-Object System.Drawing.Size(250, 30)
$nameBox.Location = New-Object System.Drawing.Point(180, 102)
$form.Controls.Add($nameBox)

$instruction = New-Object System.Windows.Forms.Label
$instruction.Text = "Click the mood that best describes how you feel:"
$instruction.Font = New-Object System.Drawing.Font("Arial", 12, [System.Drawing.FontStyle]::Bold)
$instruction.Size = New-Object System.Drawing.Size(600, 25)
$instruction.Location = New-Object System.Drawing.Point(30, 150)
$form.Controls.Add($instruction)

$messageBox = New-Object System.Windows.Forms.TextBox
$messageBox.Multiline = $true
$messageBox.ReadOnly = $true
$messageBox.ScrollBars = "Vertical"
$messageBox.Font = New-Object System.Drawing.Font("Arial", 12)
$messageBox.Size = New-Object System.Drawing.Size(820, 230)
$messageBox.Location = New-Object System.Drawing.Point(30, 380)
$messageBox.Text = "Welcome to MOTIVATE U. Enter your name, then choose a mood."
$form.Controls.Add($messageBox)

$statusLabel = New-Object System.Windows.Forms.Label
$statusLabel.Text = "Designed and Created by Bessie Mullins"
$statusLabel.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Italic)
$statusLabel.Size = New-Object System.Drawing.Size(820, 25)
$statusLabel.Location = New-Object System.Drawing.Point(30, 620)
$statusLabel.TextAlign = "MiddleCenter"
$form.Controls.Add($statusLabel)

$moodButtons = @(
    "Sad", "Happy", "Angry", "Anxious", "Tired",
    "Lonely", "Confused", "Stressed", "Fearful", "Unmotivated",
    "Grateful", "Hopeful", "Heartbroken", "Overwhelmed", "Confident"
)

$x = 30
$y = 190
$count = 0

foreach ($mood in $moodButtons) {
    $button = New-Object System.Windows.Forms.Button
    $button.Text = $mood
    $button.Size = New-Object System.Drawing.Size(160, 45)
    $button.Location = New-Object System.Drawing.Point($x, $y)
    $button.Font = New-Object System.Drawing.Font("Arial", 10, [System.Drawing.FontStyle]::Bold)
    $button.BackColor = $moodData[$mood].Color
    $button.ForeColor = $moodData[$mood].TextColor
    $button.Tag = $mood

    $button.Add_Click({
        $selectedMood = $this.Tag
        $data = $moodData[$selectedMood]

        $userName = $nameBox.Text.Trim()
        if ($userName -eq "") {
            [System.Windows.Forms.MessageBox]::Show(
                "Please enter your name before choosing a mood.",
                "Name Required",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Information
            )
            return
        }

        Play-Sound $data.Sound

        $randomMessage = Get-Random -InputObject $data.Messages

        $supportMessage = ""
        if ($data.Heavy -eq $true) {
            $supportMessage = @"

IMPORTANT SUPPORT MESSAGE:
If you feel unsafe, overwhelmed, or like you may hurt yourself, please reach out to someone you trust right now.
If you are in immediate danger, contact emergency services or a crisis hotline in your area.
"@
        }

        $fullText = @"
Hello, $userName.

$($data.Symbol)  MOOD: $selectedMood  $($data.Symbol)

$randomMessage

DAILY CHALLENGE:
$($data.Challenge)

$supportMessage

Thank you for using MOTIVATE U!
Remember: keep moving forward, one foot in front of the other.
One step, one fight, one victory at a time.

Designed and Created by Bessie Mullins
"@

        $form.BackColor = $data.Color
        $form.ForeColor = $data.TextColor
        $title.ForeColor = $data.TextColor
        $creator.ForeColor = $data.TextColor
        $nameLabel.ForeColor = $data.TextColor
        $instruction.ForeColor = $data.TextColor
        $statusLabel.ForeColor = $data.TextColor

        $messageBox.BackColor = [System.Drawing.Color]::White
        $messageBox.ForeColor = [System.Drawing.Color]::Black
        $messageBox.Text = $fullText
    })

    $form.Controls.Add($button)

    $x += 170
    $count++

    if ($count % 5 -eq 0) {
        $x = 30
        $y += 55
    }
}

$resetButton = New-Object System.Windows.Forms.Button
$resetButton.Text = "Reset"
$resetButton.Size = New-Object System.Drawing.Size(120, 35)
$resetButton.Location = New-Object System.Drawing.Point(600, 100)
$resetButton.BackColor = [System.Drawing.Color]::LightGray
$resetButton.ForeColor = [System.Drawing.Color]::Black
$resetButton.Add_Click({
    $form.BackColor = [System.Drawing.Color]::Black
    $form.ForeColor = [System.Drawing.Color]::White
    $title.ForeColor = [System.Drawing.Color]::White
    $creator.ForeColor = [System.Drawing.Color]::White
    $nameLabel.ForeColor = [System.Drawing.Color]::White
    $instruction.ForeColor = [System.Drawing.Color]::White
    $statusLabel.ForeColor = [System.Drawing.Color]::White
    $messageBox.Text = "Welcome to MOTIVATE U. Enter your name, then choose a mood."
})
$form.Controls.Add($resetButton)

$exitButton = New-Object System.Windows.Forms.Button
$exitButton.Text = "Exit"
$exitButton.Size = New-Object System.Drawing.Size(120, 35)
$exitButton.Location = New-Object System.Drawing.Point(730, 100)
$exitButton.BackColor = [System.Drawing.Color]::LightGray
$exitButton.ForeColor = [System.Drawing.Color]::Black
$exitButton.Add_Click({
    $form.Close()
})
$form.Controls.Add($exitButton)

[void]$form.ShowDialog()
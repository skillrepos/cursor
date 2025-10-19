# Cursor Workshop - Instructor Guide

## Workshop Overview

**Title:** Cursor AI Workshop: Build Apps with AI Assistance
**Duration:** 3 hours
**Level:** Beginner to Intermediate
**Class Size:** 10-30 students recommended

## Pre-Workshop Setup

### 1 Week Before
- [ ] Send setup instructions to attendees
- [ ] Share prerequisite knowledge requirements
- [ ] Test all labs in fresh environment
- [ ] Prepare demo projects
- [ ] Create feedback survey

### 1 Day Before
- [ ] Test presentation setup
- [ ] Verify internet connectivity
- [ ] Test screen sharing
- [ ] Clone workshop repo
- [ ] Test Codespace setup
- [ ] Prepare backup USB drives with materials

### Day Of
- [ ] Arrive 30 minutes early
- [ ] Test projector/screen
- [ ] Verify WiFi access
- [ ] Open all lab files
- [ ] Have backup plan ready

## Materials Needed

### Required
- Projector and screen
- Stable internet connection
- Cursor installed (for local demos)
- GitHub Codespaces access
- Microphone (for larger rooms)

### Optional
- Printed quick reference cards
- Workshop certificates
- Swag/stickers
- Business cards

## Detailed Schedule

### 0:00-0:20 Introduction & Setup (20 min)

**Instructor Actions:**
1. Welcome attendees (2 min)
2. Share workshop agenda (2 min)
3. Brief icebreaker (3 min)
   - "What do you hope to build with AI?"
   - Quick show of hands on experience levels
4. Setup verification (8 min)
   - GitHub Codespace access
   - Or local Cursor installation
   - Verify everyone can access materials
5. Quick Cursor overview (5 min)
   - Show the interface
   - Point out key features
   - Set expectations

**Key Points to Emphasize:**
- Cursor is an AI-first editor
- Learn by doing, not just watching
- Ask questions anytime
- Mistakes are learning opportunities

**Common Issues:**
- Codespace loading slowly → Use local install
- Cursor not autocompleting → Check settings
- Can't access repo → Share via USB backup

---

### 0:20-0:40 Lab 1: Getting Started (20 min)

**Format:** 5 min demo + 10 min hands-on + 5 min discussion

**Demo Script:**
1. Open `lab1-getting-started/starter.js`
2. Show Tab autocomplete
   - Type `function greet` and wait
   - Accept with Tab
   - Reject by typing
3. Demonstrate Cmd+K
   - Select code
   - Describe change
   - Review and accept
4. Show Chat (Cmd+L)
   - Ask about code
   - Reference with @Files
5. Quick @ symbols overview

**Let Students Work:**
- Walk around the room
- Help individuals
- Answer questions
- Encourage experimentation

**Discussion Questions:**
- "What surprised you about Tab autocomplete?"
- "How is Cmd+K different from traditional editing?"
- "What would you use Chat for?"

**Troubleshooting:**
- Tab not working → Check Cursor is enabled
- Cmd+K not responding → Try selecting text first
- Chat not opening → Show sidebar icon

**Time Management:**
- If ahead: Show bonus features
- If behind: Skip optional exercises

---

### 0:40-1:00 AI Features Overview (20 min)

**Presentation:** Use slides/SLIDES.md

**Key Slides:**
1. What is Cursor (3 min)
2. Core features overview (5 min)
3. Tab autocomplete deep dive (3 min)
4. Cmd+K capabilities (3 min)
5. Chat and @ symbols (4 min)
6. Q&A (2 min)

**Demo During Presentation:**
- Show each feature live
- Use real examples
- Make mistakes on purpose
- Show recovery

**Engagement Tips:**
- Ask rhetorical questions
- Show before/after comparisons
- Share your workflow
- Be enthusiastic!

---

### 1:00-1:15 Lab 2: Code Generation (15 min)

**Format:** 3 min demo + 10 min hands-on + 2 min wrap-up

**Demo Script:**
1. Open `lab2-code-generation/`
2. Generate email validator
   - Show effective prompt
   - Review generated code
   - Refine if needed
3. Generate React component
   - Show detailed prompt
   - Accept and review
4. Iterate on component
   - Add features
   - Modify styles

**Key Teaching Points:**
- Specific prompts = better results
- Review everything
- Iterate incrementally
- Learn from generated code

**Watch For:**
- Students accepting without reviewing
- Vague prompts
- Not testing generated code
- Copying blindly

**Wrap-up:**
- "What made prompts effective?"
- "Did anyone find a better approach?"

---

### 1:15-1:30 Break (15 min)

**During Break:**
- Be available for questions
- Check in with struggling students
- Reset demo environment
- Prepare for next section

**Announcements:**
- Remind about time
- Preview next section
- Share resources

---

### 1:30-1:45 Lab 3: Refactoring (15 min)

**Format:** 3 min demo + 10 min hands-on + 2 min discussion

**Demo Script:**
1. Open `lab3-refactoring/legacy-code.js`
2. Use Chat to understand
   - Ask: "What does function p do?"
   - Get explanation
3. Refactor with Cmd+K
   - Improve naming
   - Modernize syntax
   - Add error handling
4. Compare before/after

**Teaching Points:**
- Understanding before refactoring
- Incremental improvements
- Maintain functionality
- Document as you go

**Discussion:**
- "How does Cursor help with legacy code?"
- "What refactorings were most valuable?"

---

### 1:45-2:00 Lab 4: Debugging (15 min)

**Format:** 3 min demo + 10 min hands-on + 2 min discussion

**Demo Script:**
1. Open `lab4-debugging/buggy-code.js`
2. Run code with bug
3. Copy error to Chat
4. Get explanation
5. Apply fix with Cmd+K
6. Add error handling

**Teaching Points:**
- AI explains WHY, not just HOW
- Root cause vs symptoms
- Proactive error handling
- Testing fixes

**Common Student Issues:**
- Not reading explanations
- Applying fixes without understanding
- Skipping edge cases

---

### 2:00-2:15 Advanced Features (15 min)

**Presentation:** Advanced slides

**Cover:**
1. Composer mode (4 min)
   - Live demo
   - Multi-file changes
2. @ Symbols deep dive (4 min)
   - Each type
   - Combinations
3. .cursorrules (4 min)
   - Purpose
   - Examples
4. Custom instructions (3 min)

**Make It Interactive:**
- "When would you use Composer?"
- "What rules would you add?"
- Show your own .cursorrules

---

### 2:15-2:30 Lab 5: Complete Feature (15 min)

**Format:** 2 min intro + 13 min hands-on

**Intro:**
- This simulates real development
- Use everything learned
- Build incrementally
- Ask for help

**Let Them Work:**
- Minimal interruption
- Help when asked
- Watch common patterns
- Note successes to share

**Don't Present:**
- Students need focused time
- This is the synthesis lab
- Let them struggle productively

**Circulate and:**
- Encourage good practices
- Point out clever solutions
- Help debug issues
- Keep energy up

---

### 2:30-2:50 Lab 6: Advanced Features (20 min)

**Format:** 5 min demo + 13 min hands-on + 2 min discussion

**Demo:**
1. Show Composer
   - Multi-file refactor
   - Review changes
2. Demo @ symbol combinations
3. Show .cursorrules in action
4. Quick custom instructions

**Let Students Explore:**
- This is the "power user" lab
- Encourage experimentation
- Share discoveries
- Have fun!

**Discussion:**
- Share favorite features
- Most useful @ symbol?
- Best .cursorrules ideas

---

### 2:50-3:00 Q&A & Wrap-up (10 min)

**Structure:**
1. Recap what was covered (2 min)
2. Open Q&A (5 min)
3. Next steps and resources (2 min)
4. Feedback survey (1 min)

**Recap Points:**
- Core features mastered
- Real-world applications
- Continued learning path
- Community resources

**Q&A Tips:**
- Repeat questions for room
- Be honest if you don't know
- Offer to follow up
- Keep answers concise

**Resources to Share:**
- Cursor docs
- This repository
- Community forum
- Your contact info

**Final Message:**
- Thank attendees
- Encourage daily practice
- Stay in touch
- Keep learning!

---

## Teaching Tips

### General Approach

**Do:**
- Show your mistakes and recovery
- Explain your thinking process
- Encourage questions
- Celebrate discoveries
- Be enthusiastic
- Share real examples
- Walk around during labs
- Provide multiple examples

**Don't:**
- Rush through material
- Skip demos
- Assume knowledge
- Ignore questions
- Go too deep on tangents
- Make students feel dumb
- Stay at podium whole time

### Handling Different Skill Levels

**Beginners:**
- Pair with intermediates
- Provide extra examples
- Slow down if needed
- Encourage questions
- Celebrate small wins

**Intermediate:**
- Challenge with extensions
- Ask to help others
- Share their solutions
- Push boundaries

**Advanced:**
- Give harder challenges
- Discuss architecture
- Encourage teaching
- Explore edge cases

### Common Student Questions

**"Should I trust AI-generated code?"**
- No, always review
- Understand before accepting
- Test thoroughly
- AI can make mistakes

**"Will AI replace developers?"**
- No, it's a tool
- Makes you more productive
- Still need human judgment
- Raises the bar

**"What if I can't afford Cursor?"**
- Free tier available
- Other AI tools exist
- Principles transfer
- Student discounts

**"How do I get better at prompting?"**
- Practice daily
- Be specific
- Provide context
- Iterate and refine

**"Can I use this for [X language]?"**
- Cursor supports many languages
- Quality varies
- Try it out
- Provide feedback

---

## Troubleshooting Guide

### Technical Issues

**Codespace won't start:**
- Use local Cursor installation
- Check GitHub status
- Try incognito mode
- Share via USB backup

**Cursor not suggesting:**
- Check internet connection
- Verify Cursor is enabled
- Restart Cursor
- Check API key/auth

**Features not working:**
- Update Cursor
- Check settings
- Restart application
- Clear cache

**Performance issues:**
- Close other apps
- Reduce project size
- Check system resources
- Use smaller models

### Pedagogical Issues

**Students falling behind:**
- Pair them up
- Skip optional exercises
- Offer one-on-one help
- Share solutions

**Students racing ahead:**
- Give bonus challenges
- Ask them to help others
- Discuss advanced topics
- Let them explore

**Low engagement:**
- Take a break
- Change format
- Ask questions
- Share exciting examples
- Adjust difficulty

**Too many questions:**
- Note for later discussion
- Defer to break
- Create FAQ doc
- Schedule office hours

---

## Lab Solutions

### Lab 1 - Sample Solutions

Students should achieve:
- Working Tab autocomplete
- Successful Cmd+K edits
- Chat conversations
- @ symbol usage

### Lab 2 - Expected Results

Functions and components that:
- Validate email addresses
- Format currency
- React Button component
- React Card component

### Lab 3 - Refactored Code

Legacy code should become:
- Readable variable names
- Modern ES6+ syntax
- Proper error handling
- Good documentation

### Lab 4 - Fixed Bugs

All bugs should be:
- Identified correctly
- Fixed properly
- Error handling added
- Edge cases covered

### Lab 5 - Task Manager

Working task manager with:
- Add/complete/delete tasks
- Filter functionality
- localStorage persistence
- Clean UI

### Lab 6 - Advanced Usage

Students should demonstrate:
- Composer usage
- Multiple @ symbols
- Custom .cursorrules
- Power user techniques

---

## Adapting the Workshop

### For 2 Hours

**Remove:**
- Lab 5 (complete feature)
- Some advanced features
- Extended discussions

**Condense:**
- Intro to 10 min
- Labs to 8 min each
- Break to 10 min

### For 4 Hours

**Add:**
- More hands-on time
- Advanced topics
- Team projects
- Code reviews
- Best practices deep dive
- Q&A sessions

### For Remote Delivery

**Adjust:**
- More frequent breaks (every 45 min)
- Screen share demos
- Breakout rooms for labs
- More chat interaction
- Pre-recorded segments
- Virtual whiteboard
- Poll for engagement

**Tools:**
- Zoom/Teams
- Miro for collaboration
- Slack for questions
- Recording for review

### For Different Audiences

**Students:**
- More basics
- Focus on learning
- Career applications
- Simple projects

**Professional Developers:**
- Faster pace
- Complex projects
- Team workflows
- Integration topics

**Teams:**
- Custom .cursorrules
- Team standards
- Collaboration
- Code review

---

## Post-Workshop

### Immediately After

- [ ] Collect feedback
- [ ] Share recording (if applicable)
- [ ] Send follow-up email
- [ ] Share additional resources
- [ ] Thank participants

### Follow-up Email Template

```
Subject: Cursor Workshop - Resources & Next Steps

Hi everyone,

Thank you for attending today's Cursor workshop!

Resources:
- Workshop repository: [link]
- Slides: [link]
- Recording: [link]
- Additional tutorials: [link]

Next Steps:
1. Practice daily with real projects
2. Join Cursor community forum
3. Explore advanced features
4. Share your learnings

Questions? Reply to this email or join our Slack/Discord.

Keep building amazing things!

[Your name]
```

### Long-term Follow-up

- Monthly tips email
- Office hours
- Advanced workshops
- Community showcases
- Success stories

---

## Evaluation

### Student Success Metrics

**Knowledge:**
- Can use core features
- Understands prompting
- Knows when to use what
- Understands limitations

**Skills:**
- Generates code effectively
- Refactors confidently
- Debugs faster
- Builds features

**Confidence:**
- Comfortable asking AI
- Reviews AI suggestions
- Experiments freely
- Teaches others

### Workshop Success Metrics

**Engagement:**
- Attendance rate
- Question frequency
- Lab completion
- Participation

**Satisfaction:**
- Feedback scores
- Would recommend?
- Learning objectives met
- Pace appropriate

**Outcomes:**
- Using Cursor after
- Sharing with teams
- Productivity gains
- Return for advanced

---

## Continuous Improvement

### After Each Workshop

**Reflect:**
- What worked well?
- What confused students?
- What should change?
- What should expand?

**Update:**
- Fix unclear instructions
- Add missing examples
- Improve timing
- Update for new features

**Document:**
- Common questions
- Student insights
- Successful examples
- Failures to avoid

---

## Additional Resources for Instructors

### Stay Current

- [Cursor Blog](https://cursor.sh/blog)
- [Cursor Changelog](https://cursor.sh/changelog)
- Community forum
- YouTube tutorials
- Twitter/X updates

### Teaching Resources

- Example projects
- Video recordings
- Slide decks
- Code samples
- Assessment templates

### Community

- Instructor Slack/Discord
- Share materials
- Discuss challenges
- Collaborate on content

---

## License & Sharing

This workshop is open source (MIT License).

**You may:**
- Use for your trainings
- Modify content
- Create derivatives
- Charge for instruction

**Please:**
- Credit original source
- Share improvements
- Contribute back
- Help community

---

## Contact & Support

**Questions?**
- Workshop issues: [GitHub]
- Teaching tips: [Community]
- Content feedback: [Email]

**Contribute:**
- Report issues
- Submit improvements
- Share success stories
- Help other instructors

---

## Instructor Checklist

### Preparation
- [ ] Reviewed all materials
- [ ] Tested all labs
- [ ] Prepared demos
- [ ] Setup environment
- [ ] Created feedback survey

### During Workshop
- [ ] Engaging presentation
- [ ] Clear demos
- [ ] Individual help
- [ ] Time management
- [ ] Energy and enthusiasm

### Follow-up
- [ ] Collect feedback
- [ ] Send resources
- [ ] Document improvements
- [ ] Share outcomes
- [ ] Plan next session

---

**Good luck with your workshop! You've got this!** 🚀

For questions or support, reach out to the community or create an issue in the repository.

git add.
echo -n "what is this change for ?"
readl
git commit -m "${reply}"
git push
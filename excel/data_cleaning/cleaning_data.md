# 🧹 Data Cleaning in Excel

Data cleaning is one of the most important steps in any data analysis workflow. Clean data ensures accurate analysis, reliable insights, and professional reporting. Below is a checklist of common tasks and best practices when cleaning datasets in Excel.

---

## ✅ Things to Look for When Cleaning Data

### 1. Duplicate Data
- Use **Remove Duplicates** (Data tab → Remove Duplicates).
- Check across multiple columns to avoid partial duplicates.
- Highlight duplicates with **Conditional Formatting** for review.

### 2. Standardize Text Formatting
- Ensure consistent **case formatting** (all UPPERCASE, lowercase, or Proper Case).
- Use functions like `=UPPER()`, `=LOWER()`, or `=PROPER()`.
- Rename inconsistent column headers.

### 3. Spelling & Typo Errors
- Use Excel’s **Spell Check** (F7).
- Standardize categorical values (e.g., "Republican" vs "Republicans").
- Check for inconsistent abbreviations.

### 4. Extra Spaces & Hidden Characters
- Use `=TRIM()` to remove leading, trailing, or double spaces.
- Use `=CLEAN()` to remove non-printable characters (common in imported data).

### 5. Date & Time Formatting
- Make sure all dates follow the same format (e.g., YYYY-MM-DD).
- Use `Short Date` to fix imported dates stored in different date formats.

---

## 📌 In this folder
- In this folder I have included common data cleaning practices such as:
    - Using proper, fixing typos, using trim to remove white spaces, standardizing the date column, and removing any unused columns.  One must know the data very well to be able to make decisions such as removing a column or renaming values because they  **might** be typos.
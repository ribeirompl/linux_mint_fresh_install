# Overwrite GDrive:bookmarks_old.db with GDrive:bookmarks.db
rclone copyto GDrive:bookmarks_backup/bookmarks.db GDrive:bookmarks_backup/bookmarks_old.db

# Then overwrite GDrive:bookmarks.db with buku:bookmarks.db
rclone copyto $HOME/.local/share/buku/bookmarks.db GDrive:bookmarks_backup/bookmarks.db


#!/usr/bin/env swift
import AppKit

guard CommandLine.arguments.count == 2 else {
    fputs("usage: generate_icon.swift <output.png>\n", stderr)
    exit(2)
}

let size = NSSize(width: 1024, height: 1024)
let image = NSImage(size: size)
image.lockFocus()

let background = NSBezierPath(roundedRect: NSRect(x: 64, y: 64, width: 896, height: 896), xRadius: 210, yRadius: 210)
NSColor(calibratedRed: 0.035, green: 0.047, blue: 0.058, alpha: 1).setFill()
background.fill()

let inset = NSBezierPath(roundedRect: NSRect(x: 92, y: 92, width: 840, height: 840), xRadius: 184, yRadius: 184)
NSColor(calibratedRed: 0.57, green: 0.78, blue: 0.42, alpha: 0.12).setFill()
inset.fill()
NSColor(calibratedRed: 0.57, green: 0.78, blue: 0.42, alpha: 0.42).setStroke()
inset.lineWidth = 8
inset.stroke()

let mark = "⌘" as NSString
let attributes: [NSAttributedString.Key: Any] = [
    .font: NSFont.systemFont(ofSize: 530, weight: .medium),
    .foregroundColor: NSColor(calibratedRed: 0.57, green: 0.78, blue: 0.42, alpha: 1)
]
let markSize = mark.size(withAttributes: attributes)
mark.draw(at: NSPoint(x: (1024 - markSize.width) / 2, y: (1024 - markSize.height) / 2 - 20), withAttributes: attributes)

image.unlockFocus()
guard let tiff = image.tiffRepresentation,
      let bitmap = NSBitmapImageRep(data: tiff),
      let png = bitmap.representation(using: .png, properties: [:]) else {
    fputs("failed to render icon\n", stderr)
    exit(1)
}
try png.write(to: URL(fileURLWithPath: CommandLine.arguments[1]))

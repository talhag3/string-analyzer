<?php

namespace Talhag3\StringAnalyzer;

class StringAnalyzer
{
    public function analyze(string $text): array
    {
        return [
            'characters'   => mb_strlen($text, 'UTF-8'),
            'words'        => preg_match_all('/\b\w+\b/u', $text),
            'spaces'       => substr_count($text, ' '),
            'special_chars'=> preg_match_all('/[^\w\s]/u', $text),
        ];
    }
}